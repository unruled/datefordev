require 'rails_helper'

describe "Sign in", type: :feature do

  it "should be successfully" do
    user = create :user
    visit new_user_session_path

    within '#new_sign_in' do
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: attributes_for(:user)[:password]
      find('input[type="submit"]').click
    end

    expect(page).to have_content I18n.t("sign_out")
    expect(page).not_to have_content I18n.t("sign_in")
    expect(URI.parse(current_url).path).to eq girls_path
  end

  it "should not be successfully with incorrect details" do
    visit new_user_session_path

    within '#new_sign_in' do
      fill_in 'user_email', with: 'temp@mail.ex'
      fill_in 'user_password', with: '1'*10
      find('input[type="submit"]').click
    end

    expect(page).to have_content I18n.t("sign_in")
    expect(page).not_to have_content I18n.t("sign_out")
    expect(URI.parse(current_url).path).to eq new_user_session_path
  end

  it "should be successfully with same details from signup form" do
    created_user = create(:user)
    visit new_user_session_path
    user_attributes = attributes_for(:user)

    within '#new_user' do
      fill_in 'user_username', with: user_attributes[:username]
      fill_in 'user_email', with: user_attributes[:email]
      fill_in 'user_password', with: user_attributes[:password]
      find('input[type="submit"]').click
    end

    expect(page).to have_content I18n.t("sign_out")
    expect(page).to have_content I18n.t("hello_msg", :name => created_user.name)
    expect(URI.parse(current_url).path).to eq new_user_session_path
  end

end
