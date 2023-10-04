require 'rails_helper'

RSpec.feature 'User Show Page Details (What users see)', type: :feature do
  before do
    @user = User.create(name: 'César Herrera', photo: 'https://i.pravatar.cc/150?img=3', bio: 'I am a developer')
    @post1 = Post.create(author_id: @user.id, title: 'My first post', text: 'This is my first post')
    @post2 = Post.create(author_id: @user.id, title: 'My second post', text: 'This is my second post')
    @post3 = Post.create(author_id: @user.id, title: 'My third post', text: 'This is my third post')
  end
  # I can see the user's profile picture.
  scenario 'shows the user profile picture' do
    visit user_path(@user.id)
    expect(page).to have_css("img[src*='https://i.pravatar.cc/150?img=3']")
  end

  # I can see the user's username.
  # I can see the number of posts the user has written.
  scenario 'shows the user username and the real number of posts the user has written' do
    visit user_path(@user.id)
    expect(page).to have_content('César Herrera')
    expect(page).to have_content('Number of post: 3')
  end

  # I can see the user's bio.
  scenario 'shows the user bio' do
    visit user_path(@user.id)
    expect(page).to have_content('I am a developer')
  end

  # I can see a button that lets me view all of a user's posts.
  scenario 'shows a button that lets me view all of a user posts' do
    visit user_path(@user.id)
    expect(page).to have_content('See all post')
  end

  # I can see the user's first 3 posts.
  scenario 'shows the user first 3 posts' do
    visit user_path(@user.id)
    expect(page).to have_content('My first post')
    expect(page).to have_content('My second post')
    expect(page).to have_content('My third post')
  end
end
