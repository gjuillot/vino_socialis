# -*- coding: utf-8 -*-

estate_name = 'Château de Plaisance'
unless Estate.find_by_name(estate_name)
  if Estate.create(name: estate_name, user_id: 1, owner: "Patricia et Guy Rochais", address: "Plaisance", zip_code: "49190", town: "Rochefort-sur-Loire", country: "France", phone: "02 41 78 33 01", fax: "02 41 78 67 52", email: "info@chateaudeplaisance.com", www: "http://www.chateaudeplaisance.com/", validation: true)
    puts "Estate #{estate_name} created"
  else
    puts "COULD NOT CREATE Estate #{estate_name}"
  end
end

estate = Estate.find_by_name(estate_name)
if estate
  [
    {name: 'Quarts de Chaume', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Quarts de Chaume').id, wine_color: 'moelleux_white', validation: true, info: ''},
    {name: 'Les Zerzilles', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Chaume').id, wine_color: 'moelleux_white', validation: true, info: ''},
    {name: 'Les Charmelles', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Chaume').id, wine_color: 'moelleux_white', validation: true, info: ''},
    {name: 'Chaume', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Chaume').id, wine_color: 'moelleux_white', validation: true, info: ''},
    {name: 'A la folie', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Côteaux du Layon').id, wine_color: 'moelleux_white', validation: true, info: ''},
    {name: 'L\'insolent de Chaume', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Anjou').id, wine_color: 'white', validation: true, info: ''},
    {name: 'Le Clos', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Savennières').id, wine_color: 'white', validation: true, info: ''},
    {name: 'Savennières', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Savennières').id, wine_color: 'white', validation: true, info: ''},
    {name: 'Embruns', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Anjou').id, wine_color: 'white', validation: true, info: ''},
    {name: 'La Croix Pistolle', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Anjou-Villages').id, wine_color: 'red', validation: true, info: ''},
    {name: 'Clos de l\'Etang', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Anjou-Villages').id, wine_color: 'red', validation: true, info: ''},
    {name: 'Entre Copains', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Anjou').id, wine_color: 'red', validation: true, info: ''},
    {name: 'Plaisir', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Rosé de Loire').id, wine_color: 'rose', validation: true, info: ''},
    {name: 'Tendresse', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Cabernet d\'Anjou').id, wine_color: 'rose', validation: true, info: ''},
    {name: 'Crémant de Loire', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Crémant de Loire').id, wine_color: 'sparkling_white', validation: true, info: ''}
  ].each do |wine|
    if Wine.unscoped.where('name = ? AND estate_id = ? AND area_id = ? AND wine_color = ?', wine[:name], estate.id, wine[:area_id], wine[:wine_color]).count == 0
      if Wine.create(wine)
        puts "Wine #{estate_name} - " + wine[:name] + " created"
      else
        puts "COULD NOT CREATE #{estate_name} - " + wine[:name] + " created"
      end
    end
  end
end
