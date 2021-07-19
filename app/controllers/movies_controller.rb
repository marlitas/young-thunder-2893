class MoviesController < ApplicationController
  def show
    @movie = Movie.find(params[:id])
    @actors = @movie.actors.order(:age)
    @average_age = @movie.average_age
  end

  def update
    @movie = Movie.find(params[:id])
    @actor = Actor.create!(name: params[:name], age: params[:age])
    @movie.actors << @actor

    redirect_to "/movies/#{@movie.id}"
  end
end
