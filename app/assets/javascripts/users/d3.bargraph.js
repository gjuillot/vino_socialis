var m = [30, 40, 0, 180], // top right bottom left
    w = 920 - m[1] - m[3], // width
    h = 380 - m[0] - m[2], // height
    y = 20, // bar height
    z = d3.scale.ordinal().range(["#c24641", "#7E2217"]), // bar color
    duration = 750,
    delay = 25;
    
function bargraph(datas, div_id, comparator) {
  var x = d3.scale.linear().range([0, w]);
    
  var xAxis = d3.svg.axis()
      .scale(x)
      .orient("top")
      .tickFormat(d3.format('integer'));

  var hierarchy = d3.layout.partition()
      .value(function(d) { return d.size; });
      
  if (comparator != null) {
    hierarchy = hierarchy.sort(comparator);
  }
  
  var svg = d3.select("body").select(div_id).append("svg:svg")
      .attr("width", w + m[1] + m[3])
      .attr("height", h + m[0] + m[2])
    .append("svg:g")
      .attr("transform", "translate(" + m[3] + "," + m[0] + ")");
  
  svg.append("svg:rect")
      .attr("class", "background")
      .attr("width", w)
      .attr("height", h)
      .on("click", up);
  
  svg.append("svg:g")
      .attr("class", "x axis");
  
  svg.append("svg:g")
      .attr("class", "y axis")
    .append("svg:line")
      .attr("y1", "100%");
      
  datas['svg'] = svg;
  datas['var_x'] = x;
  datas['xAxis'] = xAxis;
  
  hierarchy.nodes(datas);
  x.domain([0, datas.value]).nice();
  down(datas, 0);
}

function down(d, i) {
  var svg = find_in_root(d, 'svg');
  var x = find_in_root(d, 'var_x');
  var xAxis = find_in_root(d, 'xAxis');
  
  if (!d.children || this.__transition__) {
    window.location = $('a#bottles_path').attr('href') + '?ids=' + d.bottles;
    return;
  }
  var end = duration + d.children.length * delay;

  // Mark any currently-displayed bars as exiting.
  var exit = svg.selectAll(".enter").attr("class", "exit");

  // Entering nodes immediately obscure the clicked-on bar, so hide it.
  exit.selectAll("rect").filter(function(p) { return p === d; })
      .style("fill-opacity", 1e-6);

  // Enter the new bars for the clicked-on data.
  // Per above, entering bars are immediately visible.
  var enter = bar(d)
      .attr("transform", stack(x, i))
      .style("opacity", 1);

  // Have the text fade-in, even though the bars are visible.
  // Color the bars as parents; they will fade to children if appropriate.
  enter.select("text").style("fill-opacity", 1e-6);
  enter.select("rect").style("fill", z(true));

  // Update the x-scale domain.
  var max = d3.max(d.children, function(d) { return d.value; });
  x.domain([0, max]).nice();

  // Update the x-axis.
  if (max <= 10) {
    xAxis.tickValues([1,2,3,4,5,6,7,8,9,10]);
  } else {
    xAxis.tickValues(null);
  }
  svg.selectAll(".x.axis").transition().duration(duration).call(xAxis);

  // Transition entering bars to their new position.
  var enterTransition = enter.transition()
      .duration(duration)
      .delay(function(d, i) { return i * delay; })
      .attr("transform", function(d, i) { return "translate(0," + y * i * 1.2 + ")"; });

  // Transition entering text.
  enterTransition.select("text").style("fill-opacity", 1);

  // Transition entering rects to the new x-scale.
  enterTransition.select("rect")
      .attr("width", function(d) { return x(d.value); })
      .style("fill", function(d) { return z(!!d.children); })

  // Transition exiting bars to fade out.
  var exitTransition = exit.transition()
      .duration(duration)
      .style("opacity", 1e-6)
      .remove();

  // Transition exiting bars to the new x-scale.
  exitTransition.selectAll("rect").attr("width", function(d) { return x(d.value); });

  // Rebind the current node to the background.
  svg.select(".background").data([d]).transition().duration(end); d.index = i;
}

function up(d) {
  var svg = find_in_root(d, 'svg');
  var x = find_in_root(d, 'var_x');
  var xAxis = find_in_root(d, 'xAxis');
  
  if (!d.parent || this.__transition__) return;
  var end = duration + d.children.length * delay;

  // Mark any currently-displayed bars as exiting.
  var exit = svg.selectAll(".enter").attr("class", "exit");

  // Enter the new bars for the clicked-on data's parent.
  var enter = bar(d.parent)
      .attr("transform", function(d, i) { return "translate(0," + y * i * 1.2 + ")"; })
      .style("opacity", 1e-6);

  // Color the bars as appropriate.
  // Exiting nodes will obscure the parent bar, so hide it.
  enter.select("rect")
      .style("fill", function(d) { return z(!!d.children); })
    .filter(function(p) { return p === d; })
      .style("fill-opacity", 1e-6);

  // Update the x-scale domain.
  var max = d3.max(d.parent.children, function(d) { return d.value; });
  x.domain([0, max]).nice();

  // Update the x-axis.
  if (max <= 10) {
    xAxis.tickValues([1,2,3,4,5,6,7,8,9,10]);
  } else {
    xAxis.tickValues(null);
  }
  svg.selectAll(".x.axis").transition().duration(duration).call(xAxis);

  // Transition entering bars to fade in over the full duration.
  var enterTransition = enter.transition()
      .duration(end)
      .style("opacity", 1);

  // Transition entering rects to the new x-scale.
  // When the entering parent rect is done, make it visible!
  enterTransition.select("rect")
      .attr("width", function(d) { return x(d.value); })
      .each("end", function(p) { if (p === d) d3.select(this).style("fill-opacity", null); });

  // Transition exiting bars to the parent's position.
  var exitTransition = exit.selectAll("g").transition()
      .duration(duration)
      .delay(function(d, i) { return i * delay; })
      .attr("transform", stack(x, d.index));

  // Transition exiting text to fade out.
  exitTransition.select("text")
      .style("fill-opacity", 1e-6);

  // Transition exiting rects to the new scale and fade to parent color.
  exitTransition.select("rect")
      .attr("width", function(d) { return x(d.value); })
      .style("fill", z(true));

  // Remove exiting nodes when the last child has finished transitioning.
  exit.transition().duration(end).remove();

  // Rebind the current parent to the background.
  svg.select(".background").data([d.parent]).transition().duration(end);;
}

// Creates a set of bars for the given data node, at the specified index.
function bar(d) {
  var svg = find_in_root(d, 'svg');
  var x = find_in_root(d, 'var_x');
  var xAxis = find_in_root(d, 'xAxis');

  var bar = svg.insert("svg:g", ".y.axis")
      .attr("class", "enter")
      .attr("transform", "translate(0,5)")
    .selectAll("g")
      .data(d.children)
    .enter().append("svg:g")
      .style("cursor", function(d) { return !d.children ? null : "pointer"; })
      .on("click", down);

  bar.append("svg:text")
      .attr("x", -6)
      .attr("y", y / 2)
      .attr("dy", ".35em")
      .attr("text-anchor", "end")
      .text(function(d) { return d.name; })
    .append("svg:title")
      .text(function(d) { return d.name + ': ' + d.value; });
      
  bar.append("svg:rect")
      .attr("width", function(d) { return x(d.value); })
      .attr("height", y)
    .append("svg:title")
      .text(function(d) { return d.name + ': ' + d.value; });

  return bar;
}

// A stateful closure for stacking bars horizontally.
function stack(x, i) {
  var x0 = 0;
  return function(d) {
    var tx = "translate(" + x0 + "," + y * i * 1.2 + ")";
    x0 += x(d.value);
    return tx;
  };
}

function find_in_root(d, s) {
  if (d[s])
    return d[s];
  else
    return find_in_root(d.parent, s);
}
