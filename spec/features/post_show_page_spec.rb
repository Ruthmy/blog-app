require 'rails_helper'

RSpec.feature 'Post Show Page', type: :feature do
  before do
    @user = User.create(name: 'César Herrera', photo: 'https://i.pravatar.cc/150?img=3', bio: 'I am a developer')
    @user2 = User.create(name: 'Ruth', photo: 'https://i.pravatar.cc/151?img=3', bio: 'I am a developer')
    @post1 = Post.create(author_id: @user.id, title: 'My first post', text: 'This is my first post')
    @comment = Comment.create(author: @user2, post: @post1, text: 'This is the first comment')
    @comment2 = Comment.create(author: @user2, post: @post1, text: 'This is the second comment')
    @like = Like.create(user: @user2, post: @post1)
  end

  # I can see the post's title.
  # I can see who wrote the post.
  scenario 'shows the post title and who wrote the post' do
    visit user_post_path(@user.id, @post1.id)
    expect(page).to have_content('This is my first post')
    expect(page).to have_content('César Herrera')
  end

  # I can see how many comments it has.
  # I can see how many likes it has.
  scenario 'shows how many comments and likes a post has' do
    visit user_post_path(@user.id, @post1.id)
    expect(page).to have_content('Comments: 2, Likes: 1')
  end

  # I can see the post body.
  scenario 'shows the post body' do
    visit user_post_path(@user.id, @post1.id)
    expect(page).to have_content('This is my first post')
  end

  # I can see the username of each commentor.
  # I can see the comment each commentor left.
  scenario 'shows the username of each commentor and the comment each commentor left' do
    visit user_post_path(@user.id, @post1.id)
    expect(page).to have_content('Ruth')
    expect(page).to have_content('This is the first comment')
    expect(page).to have_content('This is the second comment')
  end
end
