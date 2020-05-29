json.array!(@research_areas) do |research_area|
  json.extract! research_area, :id, :name, :description
  json.url research_area_url(research_area, format: :json)
end
