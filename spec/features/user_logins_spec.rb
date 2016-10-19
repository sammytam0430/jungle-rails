require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do

  # SETUP
  before :each do
    @user = User.create!(
      first_name: 'Mickey',
      last_name: 'Mouse',
      email: 'mmouse@disney.com',
      password: '123456',
      password_confirmation: '123456'
      )
  end

  scenario "They can login successfully and are taken to the home page" do
    # ACT
    visit login_path
    fill_in 'email', with: 'mmouse@disney.com'
    fill_in 'password', with: '123456'
    click_button 'Login'

    # DEBUG
    save_screenshot

    # VERIFY
    expect(page).to have_css '.products'

  end
end
