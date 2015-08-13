class Course < ActiveRecord::Base

  has_many :course_offerings
  validates :department, presence: {message: ": Course department is missing"}
  validates :number, presence: {message: ": Course number is missing"}
  validates :title, presence: {message: ": Course title is missing"}
  validates :url, allow_nil: true, format: {with: URI::regexp(%w(http https)), message: ": Course URL is malformed"}

end
