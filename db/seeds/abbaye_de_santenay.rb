# -*- coding: utf-8 -*-

estate_name = 'Abbaye de Santenay'
unless Estate.find_by_name(estate_name)
  if Estate.create(name: estate_name, user_id: 1, owner: "Michel Clair et Fille", address: "2, rue de Lavau", zip_code: "21590", town: "Santenay", country: "France", phone: "03 80 20 62 55", fax: "03 80 20 65 37", email: "Domaine-Michel.CLAIR@wanadoo.fr", www: "", validation: true)
    puts "Estate #{estate_name} created"
  else
    puts "COULD NOT CREATE Estate #{estate_name}"
  end
end

estate = Estate.find_by_name(estate_name)
if estate
  [
    {name: 'Bourgogne Aligoté', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Bourgogne Aligoté').id, wine_color: 'white', validation: true, info: ''},
    {name: '1er Cru - Slos Comme', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Santenay').id, wine_color: 'red', validation: true, info: ''},
    {name: '1er Cru - Clos de Tavannes', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Santenay').id, wine_color: 'red', validation: true, info: ''},
    {name: '1er Cru - Gravières', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Santenay').id, wine_color: 'red', validation: true, info: ''},
    {name: 'Clos des Hâtes', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Santenay').id, wine_color: 'red', validation: true, info: ''},
    {name: 'Clos Genet', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Santenay').id, wine_color: 'red', validation: true, info: ''}
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
