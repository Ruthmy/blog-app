require 'rails_helper'

RSpec.feature 'User Show Page Actions (When the user click)', type: :feature do
  before do
    @user = User.create(name: 'César Herrera', photo: 'https://i.pravatar.cc/150?img=3', bio: 'I am a developer')
    @post1 = Post.create(author_id: @user.id, title: 'My first post', text: 'This is my first post')
    @post2 = Post.create(author_id: @user.id, title: 'My second post', text: 'This is my second post')
    @post3 = Post.create(author_id: @user.id, title: 'My third post', text: 'This is my third post')
  end

  # When I click a user's post, it redirects me to that post's show page.
  scenario 'action: redirects to the post show page when clicking on a user post and see it content' do
    visit user_path(@user.id)
    first(:link, 'My first post').click
    expect(current_path).to eq(user_post_path(@user.id, @post1.id))
    expect(page).to have_content('Comments: 0, Likes: 0')
    expect(page).to have_content('This is my first post')
    expect(page).to have_content('Comments')
    expect(page).to have_content('Add new Comment')
  end

  # When I click to see all posts, it redirects me to the user's post's index page.
  scenario 'action: redirects to the user post index page when clicking on the see all post button' do
    visit user_path(@user.id)
    click_on 'See all post'
    expect(current_path).to eq(user_posts_path(@user.id))
    expect(page).to have_content('César Herrera')
    expect(page).to have_content('Number of post: 3')
    expect(page).to have_content('My first post')
    expect(page).to have_content('My second post')
  end
end
