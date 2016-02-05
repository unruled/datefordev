require 'rails_helper'

describe "Sign up", type: :feature do
  it "should be successfully" do
    include Devise::Mailers::Helpers
    user_attributes = attributes_for(:user)
    visit new_user_session_path

    within '#new_user' do
      fill_in 'user_username', with: user_attributes[:username]
      fill_in 'user_email', with: user_attributes[:email]
      fill_in 'user_password', with: user_attributes[:password]
      find('input[type="submit"]').click
    end

    expect(page).to have_content I18n.t("sign_up_success")
    expect(URI.parse(current_url).path).to eq new_user_session_path

    registered_user = User.find_by(email: user_attributes[:email])
    expect(registered_user).not_to be_confirmed
  end

  it "should be failed with invalid details" do
    visit new_user_session_path
    user_attributes = attributes_for(:user)

    within '#new_user' do
      fill_in 'user_username', with: user_attributes[:username]
      fill_in 'user_email', with: user_attributes[:email]
      fill_in 'user_password', with: ''
      find('input[type="submit"]').click
    end

    expect(page).to have_content I18n.t("sign_in")
    expect(page).not_to have_content I18n.t("sign_out")
    expect(URI.parse(current_url).path).to eq new_user_session_path
  end

  it "should be failed with created user" do
    create(:user)
    visit new_user_session_path
    user_attributes = attributes_for(:user)

    within '#new_user' do
      fill_in 'user_username', with: user_attributes[:username]
      fill_in 'user_email', with: user_attributes[:email]
      fill_in 'user_password', with: user_attributes[:password]+'1'
      find('input[type="submit"]').click
    end

    expect(page).to have_content I18n.t("sign_in")
    expect(page).not_to have_content I18n.t("sign_out")
    expect(URI.parse(current_url).path).to eq new_user_session_path
  end

end