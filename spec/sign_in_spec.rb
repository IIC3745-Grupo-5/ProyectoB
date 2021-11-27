require "rails_helper"

describe "User signs in", type: :system do
  scenario "valid with correct credentials" do
    visit root_path
    sleep(1)
    click_link "Login"
    sleep(1)
    fill_in "user_email", with: "jdoe@uc.cl"
    fill_in "user_password", with: "password"
    sleep(1)
    click_button "Log in"

    expect(page).to have_current_path cinemas_path
  end

  scenario "try with incorrect credentials" do
    visit root_path
    sleep(1)
    click_link "Login"
    sleep(1)
    fill_in "user_email", with: "unregistered@uc.cl"
    fill_in "user_password", with: "notpassword"
    sleep(1)
    click_button "Log in"

    expect(page).to have_current_path new_user_session_path
  end
end
