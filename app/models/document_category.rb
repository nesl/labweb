class DocumentCategory < ActiveRecord::Base
  has_many :documents
  validates :name, presence: {message: ": Missing document category name"}
  validates :priority, presence: {message: ": Missing document category priority"}
  validates :priority, numericality: {only_integer: true, greater_than: 0, message: ": document category priority should be a positive integer"}

end
