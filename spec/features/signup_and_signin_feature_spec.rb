require 'spec_helper'

describe 'Signup' do

  before(:each) do
    visit '/signup'
  end

  it 'renders a form for a user to signup' do
    expect(page.body).to include('<form')
    expect(page.body).to include('<input')
  end


end

describe 'Sign in' do
  before(:each) do
    @user = create(:user)

    visit '/login'
  end

  it 'renders a sign in form' do
    expect(page.body).to include('<form')
    expect(page.body).to include('<input')
  end

  it 'takes a user to the projects page after logging in' do

    fill_in(:username, :with => 'cernanb')
    fill_in(:password, :with => 'password')

    click_on 'Log In'

    expect(page.current_path).to include('/projects')
  end
end
