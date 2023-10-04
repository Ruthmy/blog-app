require 'rails_helper'

RSpec.feature 'User post index page', type: :feature do
  before do
    @user = User.create(name: 'César Herrera', photo: 'https://i.pravatar.cc/150?img=3', bio: 'I am a developer')
    @post1 = Post.create(author_id: @user.id, title: 'My first post', text: 'This is my first post')
    @post2 = Post.create(author_id: @user.id, title: 'My second post', text: 'This is my second post')
    @post3 = Post.create(author_id: @user.id, title: 'My third post', text: 'This is my third post')
    @post4 = Post.create(author_id: @user.id, title: 'My fourth post', text: 'This is my fourth post')
    @post5 = Post.create(author_id: @user.id, title: 'My fifth post', text: 'This is my fifth post')
    @post6 = Post.create(author_id: @user.id, title: 'My sixth post', text: 'This is my sixth post')
  end

  # I can see a section for pagination if there are more posts than fit on the view.
  # It will show only 4 posts and the pagination section
  scenario 'shows a section for pagination if there are more posts than fit on the view' do
    visit user_posts_path(@user.id)
    expect(page).to have_content('My first post')
    expect(page).to have_content('My second post')
    expect(page).to have_content('My third post')
    expect(page).to have_content('My fourth post')
    expect(page).to have_content('Next')
    expect(page).to have_content('1')
    expect(page).to have_content('2')
    expect(page).to have_content('Last')
  end

  # When I click on a post, it redirects me to that post's show page.
  scenario 'action: redirects to the post show page when clicking on a user post and see it content' do
    visit user_posts_path(@user.id)
    first(:link, 'My first post').click
    expect(current_path).to eq(user_post_path(@user.id, @post1.id))
    expect(page).to have_content('Comments: 0, Likes: 0')
    expect(page).to have_content('This is my first post')
    expect(page).to have_content('Comments')
    expect(page).to have_content('Add new Comment')
    expect(page).to have_content('No comments yet')
  end
end
