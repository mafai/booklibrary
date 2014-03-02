class Book < ActiveRecord::Base
  validates :isbn, uniqueness: true
end
