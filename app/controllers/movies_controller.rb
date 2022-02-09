# frozen_string_literal: true
class MoviesController < ApplicationController
  def index
    movies = Movie.all.take(100)
    render "index", locals: { movies: movies }
  end

  def show
    movie = Movie.find(params[:id])
    render "show", locals: { movie: movie }
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      redirect_to @movie
    else
      render "new"
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :director, :plot_keywords, :year)
  end
end
