require 'rails_helper'

RSpec.describe 'Seats reservation', type: :system do
  describe 'Seats selection' do
    it 'shows the right content' do
      sign_in
      visit cinema_path(1)
      find("a[href='#{movie_path(1)}']").click
      find("a[href='#{room_path(1)}?scheduleId=1']").click
      # click_link "Sala 1"
      sleep(1)
      expect(page).to have_selector 'div#A1' # Ejemplo nomás, es necesario hacer tests de el proceso de reserva y verificar que efectivamente haya funcionado
    end
  end
end
