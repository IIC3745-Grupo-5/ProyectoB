class MoviesController < ApplicationController
  before_action :set_movie, only: %i[ show ]
  before_action :set_schedules, only: %i[ show ]
  before_action :authenticate_user!

  def new
    @movie = Movie.new
  end

  def create
    params = movie_params
    @schedules2 = Schedule.all 
    @cinema = Cinema.find_by(name: params["cinema"])
    params["cinema"] = @cinema
    @movie = Movie.create({title: params["title"] , photo: params["photo"], cinema: params["cinema"] })
    params[:movie_id] = @movie.id
    rooms = [movie_params["roomMorning"], movie_params["roomAfternoon"], movie_params["roomNight"]]
    states = ["Morning","Afternoon","Evening"]
    flag = true
    for room in rooms do
      for schedule in @schedules2 do
        for possibleRoom in schedule.rooms do
          if (possibleRoom.id === room.to_i and states[rooms.index(room)] == schedule.time) then
            flag = false
          end 
        end  
      end
    end
    @schedule = Schedule.create({time:"Morning" , movie_id: @movie.id})
    @schedule.rooms.push()
    @room = Room.find(params["roomMorning"])
    @schedule.rooms.push(@room)
    @schedule = Schedule.create({time:"Afternoon" , movie_id: @movie.id})
    @schedule.rooms.push()
    @room = Room.find(params["roomAfternoon"])
    @schedule.rooms.push(@room)
    @schedule = Schedule.create({time:"Evening" , movie_id: @movie.id})
    @schedule.rooms.push()
    @room = Room.find(params["roomNight"])
    @schedule.rooms.push(@room)
    respond_to do |format|
      if (@movie.save & flag)
        format.html { redirect_to @movie, notice: "Schedule was successfully created." }
        format.json { render :show, status: :created, location: @movie }
      else 
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json:@movie.errors , status: :unprocessable_entity }
      end
    end
    
  end

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
      params.require(:movie).permit(:title, :photo, :cinema, :roomMorning, :roomAfternoon, :roomNight)
    end
end
