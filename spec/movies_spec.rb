require 'rails_helper'

RSpec.describe 'Movies page', type: :system do
  describe 'Click the link to the first movie' do
    it 'loads the movies show path' do
      visit cinema_path(1)
      sleep(1)
      find("a[href='#{movie_path(1)}']").click
      sleep(1)
      expect(page).to have_current_path(movie_path(1))
    end

    it 'clicks the back button and goes to cinema show' do
      visit movie_path(1)
      sleep(1)
      click_link 'Back'
      sleep(1)
      expect(page).to have_current_path(cinema_path(1))
    end
  end

  describe 'Shows the right content' do
    it 'shows the correct movie title, image and three schedules' do
      visit movie_path(1)
      sleep(2)
      expect(page).to have_content('Dune')
      expect(page).to have_css("img[src*='https://cdn.hobbyconsolas.com/sites/navi.axelspringer.es/public/styles/480/public/media/image/2021/08/dune-2433609.jpg?itok=cCnYTrFm']")
      expect(page).to have_content('Morning:')
      expect(page).to have_content('Afternoon:')
      expect(page).to have_content('Evening:')
    end
  end
end
