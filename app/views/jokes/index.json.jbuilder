json.array!(@jokes) do |joke|
  json.extract! joke, :id, :name, :content
  json.url joke_url(joke, format: :json)
end
