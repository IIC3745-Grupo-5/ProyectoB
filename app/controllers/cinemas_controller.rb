class CinemasController < ApplicationController
  before_action :set_cinema, only: %i[ show ]
  before_action :authenticate_user!

  def index
    @cinemas = Cinema.all
  end

  def show
    @movies_array = []
    movies = @cinema.movies
    all_schedules = Schedule.all
    movies.each do |movie|
      schedules = all_schedules.select { |schedule| schedule.movie_id == movie.id }
      morning_schedule = schedules.find { |schedule| schedule.time == "Morning" }
      afternoon_schedule = schedules.find { |schedule| schedule.time == "Afternoon" }
      evening_schedule = schedules.find { |schedule| schedule.time == "Evening" }
      @movies_array << {
        movie: movie,
        morning_schedule: morning_schedule,
        afternoon_schedule: afternoon_schedule,
        evening_schedule: evening_schedule
      }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cinema
      @cinema = Cinema.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cinema_params
      params.require(:cinema).permit(:name)
    end
end
