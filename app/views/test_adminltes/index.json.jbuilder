json.array!(@test_adminltes) do |test_adminlte|
  json.extract! test_adminlte, :id
  json.url test_adminlte_url(test_adminlte, format: :json)
end
