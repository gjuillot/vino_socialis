# -*- coding: utf-8 -*-

Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].sort.each do |seed|
  puts "Loading #{seed}"
  load seed
end

