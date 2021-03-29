# json.partial! "posts/post", post: @post

json.ignore_nil!

json.post do
  json.name @post.title
  json.body @post.body
  json.date @post.created_at
  json.categories @post.categories
  json.user @post.user.email
  json.comments @post.comments, :body, :user_id
end
