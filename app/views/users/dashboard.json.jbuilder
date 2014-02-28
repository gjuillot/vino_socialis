json.user do
  json.extract! @user, :name
end
json.cellar do
  json.bottles @bottles
  json.oldest bottle_name(@oldest)
  json.most_expensive bottle_name(@most_expensive)
  json.tags @tags, :name, :count
  json.colors @colors
  json.ages @ages
end
json.participation do
  json.wines @wines
  json.tastings @tastings
  json.pairings @pairings
  json.books @books
end
json.friends do
  json.followed_users @user.followed_users.count
  json.followers @user.followers.count
end