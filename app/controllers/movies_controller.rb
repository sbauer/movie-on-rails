# frozen_string_literal: true
class MoviesController < ApplicationController
  def index
    movies = Movie.all.take(100)
    render "movies/index", locals: { movies: movies }
  end

  def show
    movie = Movie.find(params[:id])
    render "movies/show", locals: { movie: movie }
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)

    return render "movies/new" unless @movie.valid?

    @movie.save

    redirect_to @movie
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :director, :plot_keywords, :year)
  end
end
