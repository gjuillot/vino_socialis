# -*- coding: utf-8 -*-

estate_name = 'Domaine de la Roche Moreau'
unless Estate.find_by_name(estate_name)
  if Estate.create(name: estate_name, user_id: 1, owner: "André Davy", address: "'La Haie Longue'", zip_code: "49190", town: "Saint-Aubin-de-Luigné ", country: "France", phone: "02 41 78 34 55", fax: "02 41 78 17 70", email: "davy.larochemoreau@wanadoo.fr", www: "http://www.larochemoreau.com/", validation: true)
    puts "Estate #{estate_name} created"
  else
    puts "COULD NOT CREATE Estate #{estate_name}"
  end
end

estate = Estate.find_by_name(estate_name)
if estate
  [
    {name: 'Anjou Villages', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Anjou-Villages').id, wine_color: 'red', validation: true, info: ''},
    {name: 'Anjou', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Anjou').id, wine_color: 'red', validation: true, info: ''},
    {name: 'Quarts de Chaume', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Quarts de Chaume').id, wine_color: 'sweet_white', validation: true, info: ''},
    {name: 'Côteaux du Layon Chaume', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Côteaux du Layon Villages').id, wine_color: 'sweet_white', validation: true, info: ''},
    {name: 'Chaume', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Chaume').id, wine_color: 'sweet_white', validation: true, info: ''},
    {name: 'Côteaux du Layon Saint Aubin', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Côteaux du Layon Villages').id, wine_color: 'sweet_white', validation: true, info: ''},
    {name: 'Anjou', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Anjou').id, wine_color: 'white', validation: true, info: ''},
    {name: "Cabernet d'Anjou", estate_id: estate.id, user_id: 1, area_id: Area.find_by_name("Cabernet d'Anjou").id, wine_color: 'rose', validation: true, info: ''},
    {name: 'Rosé de Loire', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Rosé de Loire').id, wine_color: 'rose', validation: true, info: ''},
    {name: "Rosé d'Anjou", estate_id: estate.id, user_id: 1, area_id: Area.find_by_name("Rosé d'Anjou").id, wine_color: 'rose', validation: true, info: ''},
    {name: 'Brut', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Crémant de Loire').id, wine_color: 'sparkling_white', validation: true, info: ''}
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

