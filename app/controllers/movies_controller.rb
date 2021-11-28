class MoviesController < ApplicationController
  before_action :set_movie, only: %i[ show ]
  before_action :set_schedules, only: %i[ show ]
  before_action :authenticate_user!

  def new
    @movie = Movie.new
  end

  def create
    params = movie_params
    @cinema = Cinema.find_by(name: params["cinema"])
    puts @cinema
    params["cinema"] = @cinema
    @movie = Movie.create(params)
    @schedules = Schedule.create()
    respond_to do |format|
      if @movie.save
        format.html { redirect_to @movie, notice: "Schedule was successfully created." }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
    
  end

  # GET /movies or /movies.json
  def index
    @movies = Movie.all
  end

  # GET /movies/1 or /movies/1.json
  def show
    
    @morning_schedule = @schedules.find { |schedule| schedule.time == "Afternoon" }
    @afternoon_schedule = @schedules.find { |schedule| schedule.time == "Afternoon" }
    @evening_schedule = @schedules.find { |schedule| schedule.time == "Evening" }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
      @cinema = set_cinema(@movie.cinema.id)
    end

    def set_cinema(cinema_id)
      @cinema = Cinema.find(cinema_id)
    end

    def set_schedules
      @schedules = Schedule.where(movie_id: params[:id])
    end

    # Only allow a list of trusted parameters through.
    def movie_params
      params.require(:movie).permit(:title, :photo, :cinema, :time)
    end
end
