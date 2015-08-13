# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

module Configuration
  RE_FIRSTNAME = /\A(([A-Z][a-z]*)(( |-)([A-Za-z][a-z]*))*)?\z/
  RE_LASTNAME = /\A((([a-z]+|([A-Z][a-z]*))\s)*([A-Z][a-z]*))?\z/
  RE_MIDDLEINITIAL = /\A[A-Z]?\z/
  RE_PHONE = /\A([-+()0-9\s]+)?\z/
  RE_URL = /\A((http|https):\/\/\S+)?\z/
  RE_EMAIL = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  RE_YEAR = /\A(\d{4})?\z/
  RE_MONTH = /\A(0?[1-9])|(1[0-2])\z/
end