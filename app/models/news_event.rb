class NewsEvent < ActiveRecord::Base
  validates :title, presence: {message: ": News/Event title is missing"}
  validates :description, presence: {message: ": News/Event description is missing"}
  validates :date, presence: {message: ": News/Event date is missing"}
end
