class Genre < ActiveRecord::Base
  # has_many :books, dependent: :destroy
  has_many :book_genres
  has_many :books, through: :book_genres
end
