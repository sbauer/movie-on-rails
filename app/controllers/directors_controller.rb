class DirectorsController < ApplicationController
  def index
    directors = Director.all

    render "index", locals: { directors: directors }
  end

  def new
    director = Director.new

    render "new", locals: { director: director }
  end

  def create
    director = Director.new(director_params)

    if director.save
      redirect_to director
    else
      render "new", locals: { director: director }
    end
  end

  def show
    director = Director.find(params[:id])
    movies = director.movies.order(facebook_likes: :desc)

    render "show", locals: { director: director, movies: movies }
  end

  private

  def director_params
    params.require(:director).permit(:name)
  end
end