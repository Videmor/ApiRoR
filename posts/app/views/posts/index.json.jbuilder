json.posts do
  json.array!(@posts) do |post|
    json.extract! post, :name #:id, :name, :post_url, :user_id
    json.url post_url(post, format: :json)
    json.active true
  end
end

