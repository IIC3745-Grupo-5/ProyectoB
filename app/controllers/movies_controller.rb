class MoviesController < ApplicationController
  before_action :set_movie, only: %i[ show ]
  before_action :set_schedules, only: %i[ show ]
  before_action :authenticate_user!

  def new
    @movie = Movie.new
    @cinema = Cinema.find(params[:cinema_id])

    schedules = Schedule.all
    morning_schedules = schedules.select { |schedule| schedule.time == "Morning" }
    afternoon_schedules = schedules.select { |schedule| schedule.time == "Afternoon" }
    evening_schedules = schedules.select { |schedule| schedule.time == "Evening" }

    morning_possible_rooms = [*1..8]
    morning_schedules.each do |schedule|
      schedule.rooms.each do |room|
        morning_possible_rooms.delete(room.id)
      end
    end
    afternoon_possible_rooms = [*1..8]
    afternoon_schedules.each do |schedule|
      schedule.rooms.each do |room|
        afternoon_possible_rooms.delete(room.id)
      end
    end
    evening_possible_rooms = [*1..8]
    evening_schedules.each do |schedule|
      schedule.rooms.each do |room|
        evening_possible_rooms.delete(room.id)
      end
    end
    @morning_placeholders = morning_possible_rooms.join(';')
    @afternoon_placeholders = afternoon_possible_rooms.join(';')
    @evening_placeholders = evening_possible_rooms.join(';')
  end

  def create
    @cinema = Cinema.find_by(params[:cinema])
    schedules = Schedule.all
    morning_schedules = schedules.select { |schedule| schedule.time == "Morning" }
    afternoon_schedules = schedules.select { |schedule| schedule.time == "Afternoon" }
    evening_schedules = schedules.select { |schedule| schedule.time == "Evening" }

    morning_possible_rooms = [*1..8]
    morning_schedules.each do |schedule|
      schedule.rooms.each do |room|
        morning_possible_rooms.delete(room.id)
      end
    end
    afternoon_possible_rooms = [*1..8]
    afternoon_schedules.each do |schedule|
      schedule.rooms.each do |room|
        afternoon_possible_rooms.delete(room.id)
      end
    end
    evening_possible_rooms = [*1..8]
    evening_schedules.each do |schedule|
      schedule.rooms.each do |room|
        evening_possible_rooms.delete(room.id)
      end
    end

    morning_rooms = movie_params[:roomMorning].gsub(/\s+/, "").split(";").map(&:to_i)
    afternoon_rooms = movie_params[:roomAfternoon].gsub(/\s+/, "").split(";").map(&:to_i)
    evening_rooms = movie_params[:roomNight].gsub(/\s+/, "").split(";").map(&:to_i)

    flag = true
    morning_rooms.each do |room|
      if !morning_possible_rooms.include?(room)
        flag = false
      end
    end
    afternoon_rooms.each do |room|
      if !afternoon_possible_rooms.include?(room)
        flag = false
      end
    end
    evening_rooms.each do |room|
      if !evening_possible_rooms.include?(room)
        flag = false
      end
    end

    @movie = Movie.create({ title: movie_params[:title] , photo: movie_params[:photo], cinema: @cinema })
    @schedule1 = Schedule.create({ time: "Morning", movie_id: @movie.id })
    @schedule2 = Schedule.create({ time: "Evening", movie_id: @movie.id })
    @schedule3 = Schedule.create({ time: "Afternoon", movie_id: @movie.id })

    morning_rooms.each do |room|
      found_room = Room.find(room)
      @schedule1.rooms.push(found_room)
    end
    afternoon_rooms.each do |room|
      found_room = Room.find(room)
      @schedule2.rooms.push(found_room)
    end
    evening_rooms.each do |room|
      found_room = Room.find(room)
      @schedule3.rooms.push(found_room)
    end
    @schedule2.save
    @schedule1.save
    @schedule3.save
    
    respond_to do |format|
      if (flag)
        format.html { redirect_to cinema_path(@cinema.id), notice: "Movie was successfully created." }
      else
        @schedule2.destroy
        @schedule1.destroy
        @schedule3.destroy
        @movie.destroy
        format.html { redirect_to cinema_path(@cinema.id), notice: "There was an error creating a movie, a room was already occupied" }
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
