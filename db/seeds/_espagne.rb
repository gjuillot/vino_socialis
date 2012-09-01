# -*- coding: utf-8 -*-

{
  'España' => {
    'Andalucia' => [
      'Condado de Huelva',
      'Jerez-Xérès-Sherry',
      'Málaga',
      'Manzanilla de Sanlúcar de Barrameda',
      'Montilla-Moriles',
      'Sierras de Málaga',
      'Vino Naranja del Condado de Huelva',
      'Granada',
      'Lebrija',
      'Altiplano de Sierra Nevada',
      'Ribera del Andarax',
      'Bailén',
      'Cádiz',
      'Córdoba',
      'Cumbres del Guadalfeo',
      'Desierto de Almería',
      'Laderas del Genil',
      'Laujar-Alpujarra',
      'Los Palacios',
      'Norte de Almería',
      'Sierras de Las Estancias y Los Filabres',
      'Sierra Norte de Sevilla',
      'Sierra Sur de Jaén',
      'Torreperogil',
      'Villaviciosa de Córdoba',
      'Viñedos de España',
    ],
    'Aragón' => [
      'Calatayud',
      'Campo de Borja',
      'Cariñena',
      'Somontano',
      'Cava  Bajo Aragón',
      'Ribera del Gállego-Cinco Villas',
      'Valdejalón',
      'Valle del Cinca',
      'Ribera del Jiloca',
      'Ribera del Queiles',
      'Viñedos de España'
    ],
    'Principado de Asturias' => [
      'Cangas'
    ],
    'Islas Baleares' => [
      'Binissalem',
      'Pla i Llevant',
      'Ibiza',
      'Illes Balears',
      'Isla de Menorca',
      'Serra de Tramuntana-Costa Nord',
      'Formentera',
      'Mallorca',
      'Viñedos de España'
    ],
    'Islas Canarias' => [
      'Abona',
      'La Gomera',
      'Gran Canaria',
      'El Hierro',
      'La Palma',
      'Lanzarote',
      'Tacoronte-Acentejo',
      'Valle de Güímar',
      'Valle de La Orotava',
      'Ycoden-Daute-Isora',
      'Viñedos de España'
    ],
    'Cantabria' => [
      'Costa de Cantabria',
      'Liébana'
    ],
    'Castilla-La Mancha' => [
      'Almansa',
      'Campo de la Guardia',
      'Dehesa del Carrizal',
      'Casa del Blanco',
      'Dominio de Valdepusa',
      'Finca Élez',
      'Pago Florentino',
      'Guijoso',
      'La Mancha',
      'Manchuela',
      'Méntrida',
      'Mondéjar',
      'Pago Calzadilla',
      'Ribera del Júcar',
      'Valdepeñas',
      'Jumilla',
      'Uclés',
      'Castilla',
      'Gálvez',
      'Pozohondo',
      'Sierra de Alcaraz',
      'Viñedos de España'
    ],
    'Castilla y León' => [
      'Arlanza',
      'Arribes',
      'Bierzo',
      'Cigales',
      'Ribera del Duero',
      'Rioja',
      'Rueda',
      'Sierra de Salamanca',
      'Tierra de León',
      'Tierra del Vino de Zamora',
      'Toro',
      'Valles de Benavente',
      'Valtiendas',
      'Cava  Castilla y León'
    ],
    'Cataluña' => [
      'Alella',
      'Ampurdán',
      'Cataluña',
      'Conca de Barberá',
      'Costers del Segre',
      'Montsant',
      'Penedés',
      'Pla de Bages',
      'Priorato',
      'Tarragona',
      'Terra Alta',
      'Cava',
      'Viñedos de España'
    ],
    'Extremadura' => [
      'Ribera del Guadiana',
      'Cava',
      'Extremadura',
      'Viñedos de España'
    ],
    'Galicia' => [
      'Monterrei',
      'Rías Baixas',
      'Ribeira Sacra',
      'Ribeiro',
      'Valdeorras',
      'Betanzos',
      'Valle del Miño-Orense',
      'Barbanza e Iria'
    ],
    'Comunidad de Madrid' => [
      'Vinos de Madrid',
      'Viñedos de España'
    ],
    'Región de Murcia' => [
      'Alicante',
      'Bullas',
      'Yecla',
      'Jumilla',
      'Abanilla',
      'Campo de Cartagena',
      'Murcia',
      'Viñedos de España'
    ],
    'Navarra' => [
      'Navarra',
      'Otazu',
      'Prado de Irache',
      'Rioja',
      'Pago de Arínzano',
      'Cava',
      'Ribera del Queiles',
      'Tres Riberas',
      'Viñedos de España'
    ],
    'País Vasco' => [
      'Txakoli de Álava',
      'Txakoli de Bizkaia',
      'Txakoli de Getaria',
      'Rioja',
      'Cava'
    ],
    'La Rioja' => [
      'Rioja',
      'Cava',
      'Valles de Sadacia'
    ],
    'Comunidad Valenciana' => [
      'Alicante',
      'Utiel-Requena',
      'Valencia',
      'Cava',
      'Castelló',
      'El Terrerazo',
      'Viñedos de España'
    ]
  }
}.each do |s_country, regions|
  country = Country.find_or_create_by_name(s_country)
  regions.each do |s_region, areas|
    region = Region.find_or_create_by_name(s_region)
    region.country =  country
    region.save
    areas.each do |s_area|
      area = Area.find_or_create_by_name(s_area)
      area.region = region
      area.save
    end
  end
end