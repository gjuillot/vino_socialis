# -*- coding: utf-8 -*-

estate_name = 'Seppi Landmann'
unless Estate.find_by_name(estate_name)
  if Estate.create(name: estate_name, user_id: 1, owner: "Seppi Landmann", address: "20, rue de la Vallée", zip_code: "68570", town: " Soultzmatt", country: "France", phone: " 03 89 47 09 33", fax: "03 89 47 06 99", email: "contact@seppi-landmann.fr", www: "http://www.seppi-landmann.fr/", validation: true)
    puts "Estate #{estate_name} created"
  else
    puts "COULD NOT CREATE Estate #{estate_name}"
  end
end

estate = Estate.find_by_name(estate_name)
if estate
  [
    {name: 'Sylvaner', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Alsace Sylvaner').id, wine_color: 'white', validation: true, info: ''},
    {name: 'Z', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Alsace Sylvaner').id, wine_color: 'sweet_white', validation: true, info: ''},
    {name: 'Riesling', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Alsace Riesling').id, wine_color: 'white', validation: true, info: ''},
    {name: 'Cuvée Sophie Marceau', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Alsace Riesling').id, wine_color: 'white', validation: true, info: ''},
    {name: 'Pinot Blanc', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Alsace Pinot Blanc').id, wine_color: 'white', validation: true, info: ''},
    {name: 'Pinot Gris', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Alsace Pinot Gris').id, wine_color: 'white', validation: true, info: ''},
    {name: 'Cuvée Sophie Marceau', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Alsace Pinot Gris').id, wine_color: 'white', validation: true, info: ''},
    {name: 'Bollenberg', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Alsace Pinot Gris').id, wine_color: 'white', validation: true, info: ''},
    {name: 'Cuvée Caméléon', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Alsace').id, wine_color: 'white', validation: true, info: ''},
    {name: 'Pinot Noir rosé', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Alsace Pinot Noir').id, wine_color: 'rose', validation: true, info: ''},
    {name: 'Ronces sans Epines', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Alsace Pinot Noir').id, wine_color: 'red', validation: true, info: ''},
    {name: 'Muscat', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Alsace Muscat').id, wine_color: 'white', validation: true, info: ''},
    {name: 'Gewürztraminer', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Alsace Gewürztraminer').id, wine_color: 'white', validation: true, info: ''},
    {name: 'Cuvée Sophie Marceau', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Alsace Gewürztraminer').id, wine_color: 'white', validation: true, info: ''},
    {name: 'Hospices de Strasbourg', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Alsace Riesling').id, wine_color: 'white', validation: true, info: ''},
    {name: 'Hospices de Strasbourg', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Alsace Pinot Gris').id, wine_color: 'white', validation: true, info: ''},
    {name: 'Hospices de Strasbourg', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Alsace Gewürztraminer').id, wine_color: 'white', validation: true, info: ''},
    {name: 'Brut', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Crémant d\'Alsace').id, wine_color: 'sparkling_white', validation: true, info: ''},
    {name: 'Brut de Brut', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Crémant d\'Alsace').id, wine_color: 'sparkling_white', validation: true, info: ''},
    {name: 'Brut Réserve', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Crémant d\'Alsace').id, wine_color: 'sparkling_white', validation: true, info: ''},
    {name: 'Cuvée Erotique', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Alsace Muscat').id, wine_color: 'white', validation: true, info: ''},
    {name: 'Hors-la-Loi', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Alsace Pinot Blanc').id, wine_color: 'white', validation: true, info: ''},
    {name: 'Hors-la-Loi', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Alsace Sylvaner').id, wine_color: 'sweet_white', validation: true, info: ''},
    {name: 'Hors-la-Loi', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Alsace Riesling').id, wine_color: 'white', validation: true, info: ''},
    {name: 'Hors-la-Loi', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Alsace Gewürztraminer').id, wine_color: 'white', validation: true, info: ''},
    {name: 'Riesling - Zinnkoepflé', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Alsace Grand Cru').id, wine_color: 'white', validation: true, info: ''},
    {name: 'Pinot Gris - Zinnkoepflé', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Alsace Grand Cru').id, wine_color: 'white', validation: true, info: ''},
    {name: 'Gewürztraminer - Zinnkoepflé', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Alsace Grand Cru').id, wine_color: 'white', validation: true, info: ''},
    {name: 'Riesling - Vendanges Tardives - Zinnkoepflé', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Alsace Grand Cru').id, wine_color: 'sweet_white', validation: true, info: ''},
    {name: 'Vendages Tardives - Hospices de Strasbourg  ', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Alsace Riesling').id, wine_color: 'sweet_white', validation: true, info: ''},
    {name: 'Riesling - Sélection de Grains Nobles - Zinnkoepflé', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Alsace Grand Cru').id, wine_color: 'moelleux_white', validation: true, info: ''},
    {name: 'Vendanges Tardives - Bollenberg', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Alsace Pinot Gris').id, wine_color: 'sweet_white', validation: true, info: ''},
    {name: 'Pinot Gris - Sélection de Grains Nobles - Zinnkoepflé', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Alsace Grand Cru').id, wine_color: 'moelleux_white', validation: true, info: ''},
    {name: 'Gewürztraminer - Vendanges Tardives - Zinnkoepflé', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Alsace Grand Cru').id, wine_color: 'sweet_white', validation: true, info: ''},
    {name: 'Gewürztraminer - Sélection de Grains Nobles - Zinnkoepflé', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Alsace Grand Cru').id, wine_color: 'moelleux_white', validation: true, info: ''},
    {name: 'Jardin des Délices', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Alsace Pinot Noir').id, wine_color: 'red', validation: true, info: ''},
    {name: 'Vin de glace', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Alsace Sylvaner').id, wine_color: 'moelleux_white', validation: true, info: ''},
    {name: 'Vin de glace', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Alsace Riesling').id, wine_color: 'moelleux_white', validation: true, info: ''},
    {name: 'Vin de glace', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Alsace Gewürztraminer').id, wine_color: 'moelleux_white', validation: true, info: ''}
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

