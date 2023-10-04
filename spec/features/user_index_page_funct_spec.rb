require 'rails_helper'

RSpec.feature 'User Index Page - Create post function', type: :feature do
  before do
    @user = User.create(name: 'César Herrera', photo: 'https://i.pravatar.cc/150?img=3', bio: 'I am a developer')
  end

  # Left an empty database after all tests
  after(:all) do
    Post.destroy_all
    User.destroy_all
  end

  # Create a new post
  scenario 'action: create a new post' do
    visit users_path
    click_link('Add a new post')
    fill_in('Title', with: 'My new post')
    fill_in('Text', with: 'This is my new post')
    click_button('Create Post')
    expect(current_path).to eq(user_path(@user.id))
    expect(page).to have_content('My new post')
    expect(page).to have_content('This is my new post')
    expect(page).to have_content('Post successfully added!')
  end

  # Create a new post with empty title or text
  scenario 'action: create a new post with empty title or text' do
    visit users_path
    # Try with just post title
    click_link('Add a new post')
    fill_in('Title', with: 'This is my title')
    click_button('Create Post')
    expect(current_path).to eq(new_user_post_path(@user.id))
    expect(page).to have_content('Post could not be added.')
    # Try just with post text
    fill_in('Text', with: 'This is my new post')
    click_button('Create Post')
    expect(current_path).to eq(new_user_post_path(@user.id))
    expect(page).to have_content('Post could not be added.')
  end
end
