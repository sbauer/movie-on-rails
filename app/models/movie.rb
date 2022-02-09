# app/models/movie.rb

class Movie < ApplicationRecord
  validates :title, presence: true

end