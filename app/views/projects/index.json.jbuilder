json.array!(@projects) do |project|
  json.extract! project, :id, :name, :title, :description, :isactive, :url, :miscattributes, :main_research_area_id
  json.url project_url(project, format: :json)
end
