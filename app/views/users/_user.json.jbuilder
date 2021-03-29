json.extract! user, :id, :email, :posts
json.url user_url(user, format: :json)
