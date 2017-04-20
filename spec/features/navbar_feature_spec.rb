require 'spec_helper'

describe 'Navbar' do

  before(:each) do
    visit '/'
  end

  it 'has a link to the root route' do
    expect(page).to have_link('Home')
  end

  describe 'not logged in' do
    it 'has a link to sign up' do
      expect(page).to have_link('Sign Up')
    end

    it 'has a link to sign in' do
      expect(page).to have_link('Sign In')
    end
  end

  describe 'logged in' do
    before(:each) do
        create(:user)

        visit '/login'

        fill_in(:username, with: 'cernanb')
        fill_in(:password, with: 'password')

        click_on 'Log In'
    end

    it 'does not have a sign in link' do
      expect(page).to_not have_link('Sign Up')
    end

    it 'does not have a sign up link' do
      expect(page).to_not have_link('Sign In')
    end

    it 'has a link to the projects index' do
      expect(page).to have_link('Projects')
    end

    it 'has a link to create a new project' do
      expect(page).to have_link('New Project')
    end
  end

end
