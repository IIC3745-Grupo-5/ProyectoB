module SignInHelpers
  def sign_in
    visit new_user_session_path
    fill_in "user_email", with: "jdoe@uc.cl"
    fill_in "user_password", with: "password"
    click_button "Log in"
  end
end
