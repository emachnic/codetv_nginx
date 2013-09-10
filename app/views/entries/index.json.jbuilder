json.array!(@entries) do |entry|
  json.extract! entry, :title, :body, :mood
  json.url entry_url(entry, format: :json)
end
