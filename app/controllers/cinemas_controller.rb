class CinemasController < ApplicationController
  before_action :set_cinema, only: %i[ show ]
  before_action :authenticate_user!

  def index
    @cinemas = Cinema.all
  end

  def show
    @movies = @cinema.movies
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
