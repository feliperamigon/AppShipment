json.array!(@containers) do |container|
  json.extract! container, :id, :string, :string, :,, :string, :,, :user_id
  json.url container_url(container, format: :json)
end
