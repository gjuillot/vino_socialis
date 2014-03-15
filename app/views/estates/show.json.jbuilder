json.extract! @estate, :id, :name, :address, :zip_code, :town, :country, :phone, :fax, :email, :www, :owner, :validated?
json.user do
  json.extract! @estate.user, :id, :name
end
json.wines @estate.wines do |json, wine|
  json.extract! wine, :id, :name, :wine_color
  json.area do
    json.extract! wine.area, :id, :name
  end
end