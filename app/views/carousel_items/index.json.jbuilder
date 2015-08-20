json.array!(@carousel_items) do |carousel_item|
  json.extract! carousel_item, :id, :itemtype, :caption, :sourceurl, :description, :gotourl, :position
  json.url carousel_item_url(carousel_item, format: :json)
end
