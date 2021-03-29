json.extract! post, :id, :title, :categories, :body, :created_at, :comments, :user_id
json.url post_url(post, format: :json)
