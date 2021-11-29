require 'rails_helper'

describe 'Movie creation page', type: :system do
  describe 'Create a movie with valid fields' do
    it 'clicks the cinema link and shows the movies' do
      sign_in
      visit cinemas_path
      click_link 'DCCinema'
      click_link 'New Movie'
      sleep(0.5)
      fill_in 'movie_title', with: 'Spiderman, No Way Home'
      fill_in 'movie_photo', with: 'https://cloudfront-us-east-1.images.arcpublishing.com/copesa/MDMG3XXXDFHETJHSBR2QEIXKQI.jpg'
      fill_in 'movie_roomMorning', with: '5'
      fill_in 'movie_roomAfternoon', with: ''
      fill_in 'movie_roomNight', with: ''
      sleep(0.5)
      click_button 'Create Movie'
      click_link 'DCCinema'
      expect(page).to have_content 'Spiderman, No Way Home'
    end
  end

  describe 'Create a movie with invalid fields' do

  end
end
