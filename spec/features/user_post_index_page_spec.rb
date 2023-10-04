require 'rails_helper'

RSpec.feature 'User post index page', type: :feature do
  before do
    @user = User.create(name: 'César Herrera', photo: 'https://i.pravatar.cc/150?img=3', bio: 'I am a developer')
    @post1 = Post.create(author_id: @user.id, title: 'My first post', text: 'This is my first post')
    @comment = Comment.create(author: @user, post: @post1, text: 'This is the first comment')
    @like = Like.create(user: @user, post: @post1)
  end

  # I can see the user's profile picture.
  scenario 'shows the user profile picture' do
    visit user_posts_path(@user.id)
    expect(page).to have_css("img[src*='https://i.pravatar.cc/150?img=3']")
  end

  # I can see the user's username.
  # I can see the number of posts the user has written.
  scenario 'shows the user username and the real number of posts the user has written' do
    visit user_posts_path(@user.id)
    expect(page).to have_content('César Herrera')
    expect(page).to have_content('Number of post: 1')
  end

  # I can see a post's title.
  # I can see some of the post's body.
  scenario 'shows a post title and some of the post body' do
    visit user_posts_path(@user.id)
    expect(page).to have_content('My first post')
    expect(page).to have_content('This is my first post')
  end

  # I can see the first comments on a post.
  scenario 'shows the first comments on a post' do
    visit user_posts_path(@user.id)
    expect(page).to have_content('This is the first comment')
  end

  # I can see how many comments a post has.
  # I can see how many likes a post has.
  scenario 'shows how many comments and likes a post has' do
    visit user_posts_path(@user.id)
    expect(page).to have_content('Comments: 1, Likes: 1')
  end
end
