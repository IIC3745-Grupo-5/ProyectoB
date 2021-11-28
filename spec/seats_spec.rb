require 'rails_helper'

RSpec.describe 'Seats reservation', type: :system do
  describe 'Seats selection' do
    it 'shows the right content' do
      sign_in
      visit cinema_path(1)
      find("a[href='#{room_path(1)}?scheduleId=2']").click
      sleep(1)
      expect(page).to have_selector 'div#A1'
    end
  end
end
