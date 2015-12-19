json.array!(@slider_objects) do |slider_object|
  json.extract! slider_object, :id
  json.url slider_object_url(slider_object, format: :json)
end
