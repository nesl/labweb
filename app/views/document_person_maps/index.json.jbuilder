json.array!(@document_person_maps) do |document_person_map|
  json.extract! document_person_map, :id, :document_id, :person_id, :rank
  json.url document_person_map_url(document_person_map, format: :json)
end
