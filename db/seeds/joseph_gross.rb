# -*- coding: utf-8 -*-

estate_name = 'Joseph Gross'
unless Estate.find_by_name(estate_name)
  if Estate.create(name: estate_name, user_id: 1, owner: "Joseph Gross", address: "21 rue Principale", zip_code: "67120", town: "Wolxheim", country: "Rance", phone: " 03 88 38 18 41", fax: "03 88 49 36 18", email: "", www: "http://www.josephgross.fr/", validation: true)
    puts "Estate #{estate_name} created"
  else
    puts "COULD NOT CREATE Estate #{estate_name}"
  end
end

estate = Estate.find_by_name(estate_name)
if estate
  [
    {name: 'Sylvaner', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Alsace Sylvaner').id, wine_color: 'white', validation: true, info: ''},
    {name: 'Pinot Blanc', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Alsace Pinot Blanc').id, wine_color: 'white', validation: true, info: ''},
    {name: 'Riesling', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Alsace Riesling').id, wine_color: 'white', validation: true, info: ''},
    {name: 'Pinot Gris', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Alsace Pinot Gris').id, wine_color: 'white', validation: true, info: ''},
    {name: 'Pinot Noir', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Alsace Pinot Noir').id, wine_color: 'red', validation: true, info: ''},
    {name: 'Gewürztraminer', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Alsace Gewürztraminer').id, wine_color: 'white', validation: true, info: ''},
    {name: 'Brut', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Crémant d\'Alsace').id, wine_color: 'sparkling_white', validation: true, info: ''},
    {name: 'Chardonnay', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Crémant d\'Alsace').id, wine_color: 'sparkling_white', validation: true, info: ''},
    {name: 'Cuvée Catherine', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Crémant d\'Alsace').id, wine_color: 'sparkling_rose', validation: true, info: ''},
    {name: 'Riesling - Altenberg de Wolxheim', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Alsace Grand Cru').id, wine_color: 'white', validation: true, info: ''},
    {name: 'Gewürztraminer - Altenberg de Wolxheim', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Alsace Grand Cru').id, wine_color: 'white', validation: true, info: ''},
    {name: 'Vendanges Tardives', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Alsace Gewürztraminer').id, wine_color: 'sweet_white', validation: true, info: ''},
    {name: 'Sélection de Grains Nobles', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Alsace Gewürztraminer').id, wine_color: 'moelleux_white', validation: true, info: ''},
    {name: 'Vendanges Tardives', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Alsace Riesling').id, wine_color: 'sweet_white', validation: true, info: ''},
    {name: 'Chasselas', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Alsace Chasselas').id, wine_color: 'white', validation: true, info: ''},
    {name: 'Rothstein de Wolxheim', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Alsace Riesling').id, wine_color: 'white', validation: true, info: ''},
    {name: 'Cuvée François', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Alsace Pinot Noir').id, wine_color: 'red', validation: true, info: ''},
    {name: 'Cuvée Lucie', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Alsace Pinot Gris').id, wine_color: 'sweet_white', validation: true, info: ''},
    {name: 'Le Gastronome', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Alsace Pinot Gris').id, wine_color: 'white', validation: true, info: ''},
    {name: 'Seppele', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Alsace').id, wine_color: 'white', validation: true, info: ''}
  ].each do |wine|
    if Wine.where('name = ? AND area_id = ? AND wine_color = ?', wine[:name], wine[:area_id], wine[:wine_color]).count == 0
      if Wine.create(wine)
        puts "Wine #{estate_name} - " + wine[:name] + " created"
      else
        puts "COULD NOT CREATE #{estate_name} - " + wine[:name] + " created"
      end
    end
  end
end

