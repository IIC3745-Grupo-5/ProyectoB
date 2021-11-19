class CinemasController < ApplicationController
  before_action :set_cinema, only: %i[ show ]

  def index
    @cinemas = Cinema.all
  end

  def show
    @rooms = @cinema.rooms
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
