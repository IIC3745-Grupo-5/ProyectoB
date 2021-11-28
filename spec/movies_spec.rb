require 'rails_helper'

RSpec.describe 'Movies page', type: :system do


  describe 'Shows the right content' do
    it 'shows the correct movie title, image and three schedules' do
      sign_in
      visit movie_path(1)
      sleep(1)
      expect(page).to have_content('Dune')
      expect(page).to have_css("img[src*='https://cdn.hobbyconsolas.com/sites/navi.axelspringer.es/public/styles/480/public/media/image/2021/08/dune-2433609.jpg?itok=cCnYTrFm']")
      expect(page).to have_content('Morning:')
      expect(page).to have_content('Afternoon:')
      expect(page).to have_content('Evening:')
    end
  end
end
