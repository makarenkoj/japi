# json.partial! "users/user", user: @user

json.ignore_nil!

json.user do
  json.email @user.email
  json.posts @user.posts, :title, :body
  json.comments @user.comments, :body, :post_id
end
