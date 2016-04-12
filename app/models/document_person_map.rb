class DocumentPersonMap < ActiveRecord::Base
  belongs_to :document
  belongs_to :person
  
  validates :document, presence: {message: ": Missing document"}
  validates :person, presence: {message: ": Missing person (author)"}
  
  validates :rank, presence: {message: ": Missing author rank"}
  validates :rank, numericality: {
              only_integer: true, greater_than_or_equal_to: 0,
              message: ": Author rank does not seem right"
            }
end
