json.array!(@products) do |product|
  json.extract! product, :id, :title, :description, :year, :month, :url, :ispublic, :islabproduct, :miscattributes, :product_category_id, :main_research_area_id
  json.url product_url(product, format: :json)
end
