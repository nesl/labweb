class DocumentPersonMap < ActiveRecord::Base
  belongs_to :document
  belongs_to :person
end
