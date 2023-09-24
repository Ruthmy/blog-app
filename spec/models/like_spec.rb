require 'rails_helper'

RSpec.describe Like, type: :model do
  before(:each) do
    @user = User.create(name: 'César Herrera', photo: 'https://www.devinpucon.com', bio: 'Developer from Chile.')
    @post = Post.create(author: @user, title: 'My first post', text: 'This is my first post')
    @like = Like.create(user: @user, post: @post)
  end

  describe 'Instance created with valid attributes' do
    it 'should be valid' do
      expect(@like).to be_valid
    end
  end

  describe 'Instance created with valid attributes should update post likes_counter' do
    it 'should update post likes_counter after create' do
      expect(@post.likes_counter).to eq(1)
    end

    it 'should update post likes_counter after destroy' do
      @like.destroy
      expect(@post.likes_counter).to eq(0)
    end
  end
end
