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

    rooms = movie_params["roomMorning"].gsub(/\s+/, "").split(";")
    rooms.push(*movie_params["roomAfternoon"].gsub(/\s+/, "").split(";"))
    rooms.push(*movie_params["roomNight"].gsub(/\s+/, "").split(";"))

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
    
    @schedule1 = Schedule.create({time:"Morning" , movie_id: @movie.id})
    @schedule2 = Schedule.create({time:"Evening" , movie_id: @movie.id})
    @schedule3 = Schedule.create({time:"Afternoon" , movie_id: @movie.id})

    if params["roomMorning"] != "" 
      
      @room = Room.find(params["roomMorning"])
      @schedule1.rooms.push(@room)
      
    end

    if params["roomAfternoon"] != "" 
      
      @room = Room.find(params["roomAfternoon"])
      @schedule2.rooms.push(@room)
      

    end

    if params["roomNight"] != "" 
      
      @room = Room.find(params["roomNight"])
      @schedule3.rooms.push(@room)
      
    end
    @schedule2.save
    @schedule1.save
    @schedule3.save
    
    respond_to do |format|
      if (@movie.save & flag)
        format.html { redirect_to cinemas_path, notice: "Schedule was successfully created." }
      else 
        format.html { render :new, status: :unprocessable_entity }
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
