json.array!(@grants) do |grant|
  json.extract! grant, :id, :name, :title, :description, :isactive, :url, :startdate, :enddate, :totalawardamount, :fundingagencyname, :awardnumber, :fundingagencyurl, :fundingagencylogourl, :fundingagencygranturl, :programname, :programurl, :miscattributes
  json.url grant_url(grant, format: :json)
end
