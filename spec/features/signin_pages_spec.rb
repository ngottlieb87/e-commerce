require 'rails_helper'

describe 'test for signing in process' do
  it 'will test user sign in' do
    visit signin_path
    click_on 'sign_in_button'
    expect(page).to have_content "There was a problem signing in. Please try again."
    visit signin_path
    FactoryBot.create(:user)
    fill_in 'Email', :with => 'g@g.com'
    fill_in 'Password', :with => 'password'
    click_on 'sign_in_button'
    expect(page).to have_content "You've signed in."
  end
end
