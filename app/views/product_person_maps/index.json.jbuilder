json.array!(@product_person_maps) do |product_person_map|
  json.extract! product_person_map, :id, :product_id, :person_id, :rank
  json.url product_person_map_url(product_person_map, format: :json)
end
