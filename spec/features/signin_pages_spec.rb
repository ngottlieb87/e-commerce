require 'rails_helper'

describe 'test for signing in process' do
  it 'will test user sign in' do
    visit signin_path
    user=FactoryBot.create(:user)
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
    click_on 'sign_in_button'
    expect(page).to have_content "You've signed in."
  end
end
