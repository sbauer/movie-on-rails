# frozen_string_literal: true
require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  test "movie is valid with a title" do
    movie = build(:movie)

    assert movie.valid?
  end

  test "movie without a title is not valid" do
    movie = Movie.new(director: build(:director))

    refute movie.valid?
  end

  test "movie with white space title is not valid" do
    movie = Movie.new(title: "   ")

    refute movie.valid?
  end

  test "lists movie titles" do
    Movie.create!(title: "Movie 1", director: build(:director))
    Movie.create!(title: "Movie 2", director: build(:director))

    titles = Movie.titles

    assert_equal ["Movie 1", "Movie 2"], titles
  end

  test "lists movies in order of facebook likes" do
    movie1 = Movie.create!(title: "Movie 1", facebook_likes: 100, director: build(:director))
    movie2 = Movie.create!(title: "Movie 2", facebook_likes: 2, director: build(:director))

    movies = Movie.by_facebook_popularity

    assert_equal [movie1, movie2], movies
  end

  test "find a movie by title and return the year" do
    Movie.create!(title: "Movie 1", year: "2022", director: build(:director))
    Movie.create!(title: "Movie 2", year: "1982", director: build(:director))

    year = Movie.movie_year_by_title("Movie 1")

    assert_equal "2022", year
  end

  test "counts movies with more facebook likes" do
    Movie.create!(title: "Movie 1", facebook_likes: 100, director: build(:director))
    Movie.create!(title: "Movie 2", facebook_likes: 2, director: build(:director))

    count = Movie.number_of_movies_with_facebook_likes_greater_than(10)

    assert_equal 1, count
  end
end
