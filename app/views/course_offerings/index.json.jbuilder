json.array!(@course_offerings) do |course_offering|
  json.extract! course_offering, :id, :year, :quarter, :url, :course_id
  json.url course_offering_url(course_offering, format: :json)
end
