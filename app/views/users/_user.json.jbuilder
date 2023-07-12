json.extract! user, :id, :name, :photo, :bio, :updatedAt, :createdAt, :postsCounter, :created_at, :updated_at
json.url user_url(user, format: :json)
