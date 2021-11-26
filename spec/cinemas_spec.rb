require 'rails_helper'

RSpec.describe 'Home page', type: :system do
  describe 'Home page content' do
    it 'shows the right content' do
      visit root_path # or cinemas_path
      sleep(2) # Wait for 2 seconds so you can see page load
      expect(page).to have_content('Welcome to DCCinema')
      expect(page).to have_content('Choose your cinema')
      expect(page).to have_link('DCCinema', href: cinema_path(1))
    end
  end

  describe 'Press of a cinema link and back' do
    it 'clicks the cinema link and shows the movies' do
      visit root_path # or cinemas_path
      sleep(1) # Wait for 1 second so you can see page load
      click_link 'DCCinema'
      sleep(2) # Wait for s seconds so you can see movies load
      expect(page).to have_content('DCCinema')
      expect(page).to have_css("img[src*='https://cdn.hobbyconsolas.com/sites/navi.axelspringer.es/public/styles/480/public/media/image/2021/08/dune-2433609.jpg?itok=cCnYTrFm']")
      expect(page).to have_css("img[src*='https://i.pinimg.com/originals/ca/5b/91/ca5b9160371f176a522a110136e2dcc1.jpg']")
      expect(page).to have_css("img[src*='http://oyster.ignimgs.com/wordpress/stg.ign.com/2021/05/VNM2_OnLine_1400x2100_TSR_RD3DDCIMAX_02.jpg']")
      expect(page).to have_css("img[src*='https://m.media-amazon.com/images/M/MV5BMTExZmVjY2ItYTAzYi00MDdlLWFlOWItNTJhMDRjMzQ5ZGY0XkEyXkFqcGdeQXVyODIyOTEyMzY@._V1_.jpg']")
      expect(page).to have_css("img[src*='https://cdn.europosters.eu/image/1300/posters/james-bond-no-time-to-die-tuxedo-i112428.jpg']")
      expect(page).to have_css("img[src*='https://m.media-amazon.com/images/M/MV5BZTcwMGFlOGItNDhiNi00YzBmLWE1MzctMmY3MDRmOWY4ODcxXkEyXkFqcGdeQXVyMDA4NzMyOA@@._V1_FMjpg_UX1000_.jpg']")
      expect(page).to have_css("img[src*='https://m.media-amazon.com/images/M/MV5BMmZiMjdlN2UtYzdiZS00YjgxLTgyZGMtYzE4ZGU5NTlkNjhhXkEyXkFqcGdeQXVyMTEyMjM2NDc2._V1_FMjpg_UX1000_.jpg']")
      expect(page).to have_css("img[src*='https://m.media-amazon.com/images/I/71nWfxOlCTL._AC_SL1398_.jpg']")
    end

    it 'clicks the back button and goes to root page' do
      visit cinema_path(1)
      sleep(2) # Wait for 2 seconds so you can see movies load
      click_link 'Logout'
      sleep(1) # Wait for 1 second so you can see page load
      sign_out_and_redirect(current_user)
      expect(page).to have_current_path(cinemas_path)
    end
  end
end
