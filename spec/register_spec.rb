require 'rails_helper'

RSpec.describe 'User sign up', type: :system do
    scenario "with valid data" do
        visit new_user_registration_path
        fill_in "user_email", with: "abcd@abcd.cl"
        fill_in "user_password", with: "password"
        fill_in "user_password_confirmation", with: "password"
        click_button "Sign up"
        expect(page).to have_content("Welcome! You have signed up successfully.")
    end

    scenario "without any data" do
        visit new_user_registration_path
        click_button "Sign up"
        expect(page).to have_content("2 errors prohibited this user from being saved:")
    end

    scenario "with valid user and invalid password" do
        visit new_user_registration_path
        fill_in "user_email", with: "irina@abcd.cl"
        fill_in "user_password", with: "hola"
        fill_in "user_password_confirmation", with: "hola"
        click_button "Sign up"
        expect(page).to have_content("Password is too short (minimum is 6 characters)")
    end

    scenario "with wrong validation password" do
        visit new_user_registration_path
        fill_in "user_email", with: "irina@abcd.cl"
        fill_in "user_password", with: "password"
        fill_in "user_password_confirmation", with: "hola"
        click_button "Sign up"
        expect(page).to have_content("Password confirmation doesn't match Password")
    end

    scenario "with user already occupied" do
        visit new_user_registration_path
        fill_in "user_email", with: "abcd@abcd.cl"
        fill_in "user_password", with: "password"
        fill_in "user_password_confirmation", with: "password"
        click_button "Sign up"
        expect(page).to have_content("Email has already been taken")
    end
end