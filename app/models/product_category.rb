class ProductCategory < ActiveRecord::Base
  has_many :products
  validates :name, presence: {message: ": Missing product category name"}
  validates :priority, presence: {message: ": Missing product category priority"}
  validates :priority, numericality: {only_integer: true, greater_than: 0, message: ": product category priority should be a positive integer"}

end
