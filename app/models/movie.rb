# frozen_string_literal: true
# app/models/movie.rb

class Movie < ApplicationRecord
  validates :title, presence: true

  def self.titles
    all.pluck(:title)
  end

  def self.by_facebook_popularity
    order(facebook_likes: :desc)
  end

  def self.movie_year_by_title(title)
    find_by(title: title)&.year
  end

  def self.number_of_movies_with_facebook_likes_greater_than(total_facebook_likes) 
    where("facebook_likes > ?", total_facebook_likes).count
  end
end