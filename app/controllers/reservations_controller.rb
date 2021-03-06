class ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[ show edit update destroy ]
  skip_before_action :verify_authenticity_token, :only => [:create]
  before_action :authenticate_user!

  # GET /reservations or /reservations.json
  def index
    @reservations = Reservation.all
  end

  # GET /reservations/1 or /reservations/1.json
  def show
  end

  # GET /reservations/new
  def new
    @reservation = Reservation.new
  end

  # GET /reservations/1/edit
  def edit
  end

  # POST /reservations or /reservations.json
  def create
    if current_user
      body = JSON.parse request.raw_post
      schedule = Schedule.find(body['scheduleId'])
      room = Room.find(body['room']['id'])
      @reservation = Reservation.create(seats: body['seats'], room: room, schedule: schedule, user: current_user)
      @reservation.save
      payload = {
        'redirect_url': "/cinemas/#{room.cinema.id}",
        'status': 201
      }
      render :json => payload, :status => 201
    else
      payload = {
        'status': 404
      }
      render :json => payload, :status => 404
    end
  end

  # PATCH/PUT /reservations/1 or /reservations/1.json
  def update
    respond_to do |format|
      if @reservation.update(reservation_params)
        format.html { redirect_to @reservation, notice: "Reservation was successfully updated." }
        format.json { render :show, status: :ok, location: @reservation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservations/1 or /reservations/1.json
  def destroy
    @reservation.destroy
    respond_to do |format|
      format.html { redirect_to reservations_url, notice: "Reservation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def reservation_params
      params.require(:reservation).permit(:seats, :room_id)
    end
end
