require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  test 'movie is valid with a title' do
    movie = Movie.new(title: 'Test', director: 'Director')

    assert movie.valid?
  end

  test 'movie without a title is not valid' do
    movie = Movie.new(director: 'Director')

    refute movie.valid?
  end

  test 'movie with white space title is not valid' do
    movie = Movie.new(title: "   ", director: 'Director')

    refute movie.valid?
  end
end