class MoviesController < ApplicationController
  before_action :set_movie, only: %i[ show ]
  before_action :set_schedules, only: %i[ show ]
  before_action :authenticate_user!

  # GET /movies or /movies.json
  def index
    @movies = Movie.all
  end

  # GET /movies/1 or /movies/1.json
  def show
    @morning_schedule = @schedules.find { |schedule| schedule.time == "Morning" }
    @afternoon_schedule = @schedules.find { |schedule| schedule.time == "Afternoon" }
    @evening_schedule = @schedules.find { |schedule| schedule.time == "Evening" }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
      @cinema = set_cinema(@movie.cinema_id)
    end

    def set_cinema(cinema_id)
      cinema = Cinema.find(cinema_id)
    end

    def set_schedules
      @schedules = Schedule.where(movie_id: params[:id])
    end

    # Only allow a list of trusted parameters through.
    def movie_params
      params.require(:movie).permit(:title, :photo, :room_id)
    end
end
