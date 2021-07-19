class MoviesController < ApplicationController
  def show
    @movie = Movie.find(params[:id])
    @actors = @movie.actors.order(:age)
    @average_age = @movie.average_age
  end
end
