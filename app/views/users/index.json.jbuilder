json.array!(@users) do |user|
  json.extract! user, :id, :email, :password, :salt
  json.url user_url(user, format: :json)
end
