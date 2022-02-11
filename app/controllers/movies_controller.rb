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
    movie = Movie.new
    render "new", locals: { movie: movie }
  end

  def create
    movie = Movie.new(movie_params)

    if movie.save
      redirect_to movie
    else
      render "new", locals: { movie: movie }
    end
  end

  def edit
    movie = Movie.find(params[:id])
    render "edit", locals: { movie: movie }
  end

  def update
    movie = Movie.find(params[:id])

    was_updated = movie.update(movie_params)

    unless was_updated
      return render "edit", locals: { movie: movie }
    end

    redirect_to movie
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :director_name, :plot_keywords, :year)
  end
end
