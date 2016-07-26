json.array!(@packages) do |package|
  json.extract! package, :id, :string, :,, :string, :,, :user_id, :,, :container_id
  json.url package_url(package, format: :json)
end
