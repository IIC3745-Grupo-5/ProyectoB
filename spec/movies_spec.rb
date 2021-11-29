require 'rails_helper'

describe 'Movie creation page', type: :system do
  describe 'Create a movie with valid fields' do
    it 'should create the movie correctly' do
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
      expect(page).to have_content 'Spiderman, No Way Home'
    end
  end

  describe 'Create a movie with an occupied room' do
    it 'should not create the movie and redirect to the movies list' do
      sign_in
      visit cinemas_path
      click_link 'DCCinema'
      click_link 'New Movie'
      sleep(0.5)
      fill_in 'movie_title', with: 'The minions'
      fill_in 'movie_photo', with: 'https://cdn.europosters.eu/image/1300/posters/despicable-me-many-minions-i23817.jpg'
      fill_in 'movie_roomMorning', with: '1'
      fill_in 'movie_roomAfternoon', with: '5'
      fill_in 'movie_roomNight', with: ''
      sleep(0.5)
      click_button 'Create Movie'
      expect(page).not_to have_content 'The minions'
    end
  end
end
