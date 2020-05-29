class ProductPersonMap < ActiveRecord::Base
  belongs_to :product
  belongs_to :person

  #TODO: validate rank
end
