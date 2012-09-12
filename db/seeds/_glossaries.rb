# -*- coding: utf-8 -*-

{
  'fr' => {
    "A.O.C." => "Voir \"Appellation d'Origine Contrôlée\"",
    "Appellation d'Origine Contrôlée (A.O.C.)" => "L'Appellation d'Origine Contrôlée (A.O.C.) garantit l'origine de produits alimentaires traditionnels, issu d'un terroir et d'un savoir-faire particulier.",
    "Appellation" => "Terme générique désignant les différentes dénominations données aux vins selon leurs origines géographiques et/ou leurs règles de production.",
    "Producteur" => "Personne ou société produisant du vin. Le raisin utilisé peut être produit ou acheté à l'extérieur.",
    "Accords mets-vins" => "Science subtile destinée à trouver quel vin accompagne au mieux un plat donné, ou à l'inverse quel plat acommpagne au mieux un vin choisi.",
    "Casier" => "Espace de rangement destiné au stockage de bouteilles. Il peut s'agir de cartons, armoire réfrigéré, étagères...",
    "Encaver" => "Ranger un vin dans une cave. S'utilise dans Vino Socialis pour indiquer une nouvelle bouteille (achetée, reçue...) que l'on souhaite suivre sur le site.",
    "Bouchonné" => "Le goût de bouchon est un terme assez large décrivant un groupe d'odeurs et de goûts indésirables trouvés dans le vin. On dit alors que le vin, est bouchonné.",
    "Doux" => "Terme s'appliquant à des vins sucrés.",
    "Moëlleux" => "Qualificatif s'appliquant généralement à des vins blancs doux se situant entre les secs et les liquoreux proprement dits. Se dit aussi, à la dégustation, d'un vin à la fois gras et peu acide.",
    "Liquoreux" => "Vins blancs riches en sucre.", 
    "Muté" => "Se dit d'un vin dont la fermentation est interrompue par adjonction d'alcool afin de conserver des sucres résiduels. Cette opération est appelée mutage.",
    "Effervescent" => "Se dit d'un vin contenant une concentration en gaz dioxyde de carbone (CO2) suffisante pour lui conférer, sinon bulles et mousse à l'ouverture de la bouteille, au moins une sensation de picotement une fois en bouche.",
    "Vin Doux Naturel" => "Dénomination officielle de certains vins obtenus par mutage.",
    "Clairet" => "Les vins de l'appellation bordeaux-clairet sont les vins les plus proches des vins qui étaient expédiés en Angleterre pendant le Moyen Âge (French claret). Ce sont des vins d'une couleur rouge légère, entre la couleur d'un bordeaux rouge et celle d'un rosé.",
    "Vin jaune" => "Vin blanc de grande garde issu du savagnin, sec et capiteux, spécialité vinicole des vignerons du Jura.",
    "Vin de paille" => "Vin liquoreux, produit à partir de la sélection des plus belles grappes des vendanges qui subissent le passerillage.",
    "Passerillage" => "Méthode de vinification où les grappes de raisin sont séchées plusieurs mois pour se concentrer en sucre et en goût sur des claies en paille ou en bois avant d'être pressurées.",
    "Vinification" => "Ensemble des opérations nécessaires à la transformation du moût en vin.",
    "Claie" => "Plateau servant à sécher les raisins.",
    "Pressurage" => "Opération qui consiste à séparer le moût ou le vin des matières solides qui les imprégnent.",
    "Moût" => "Le moût de raisin est du jus de raisin non fermenté obtenu par pressurage ou foulage. Il comprend, outre le jus de raisin, la pulpe et les peaux des grains de raisins, les pépins et éventuellement les rafles.",
    "Ambré" => "Couleur jaune orangée assez dense qui peut être observée dans certains vins assez âgés.",
    "Clayette" => "Planche servant à marquer les étages où sont stockées les bouteilles.",
    "Millésime" => "Année de récolte des raisins ayant servis à produire un vin."
   },
   'en' => {
     "A.O.C." => "See \"Appellation d'Origine Contrôlée\"",
     "Appellation d'Origine Contrôlée (A.O.C.)" => "The \"Appellation d'Origine Contrôlée (AOC)\", which translates as \"controlled designation of origin\", is the French certification granted to certain French geographical indications for wines and other agricultural products."
  }
}.each do |lang, glossaries|
  glossaries.each do |word, definition|
    if Glossary.where("lang = ? AND word = ?", lang, word).count == 0
      glossary = {lang: lang, word: word, definition: definition}
      Glossary.create glossary
    end
  end
end
