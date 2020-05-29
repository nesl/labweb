class CourseOffering < ActiveRecord::Base
  belongs_to :course

  has_many :course_offerings
  validates :course_offerings, presence: true
  validates :year, presence: {message: ": Course department is missing"}
  validates :quarter, presence: {message: ": Course number is missing"}
  validates :url, format: {with: URI::regexp(%w(http https)), allow_nil: true, message: ": Course URL is malformed"}
  validates :quarter, format: {with: /\A(Spring)|(Fall)|(Winter)|(Summer)\z/, message: ": Course Quarter is in wrong format (Winter, Spring, Summer, Fall)"}
  validates :year, numericality: {only_integer: true, greater_than: 1970, less_than: 2070, message: ": Course year does not seem right"}

end