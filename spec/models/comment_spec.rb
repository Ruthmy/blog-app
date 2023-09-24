require 'rails_helper'

RSpec.describe Comment, type: :model do
  before(:each) do
    @user = User.create(name: 'César Herrera', photo: 'https://www.devinpucon.com', bio: 'Developer from Chile.')
    @post = Post.create(author: @user, title: 'My first post', text: 'This is my first post')
    @comment = Comment.create(author: @user, post: @post, text: 'This is my first comment')
  end

  describe 'Instance created with valid attributes' do
    it 'should be valid' do
      expect(@comment).to be_valid
    end

    it 'should have a text' do
      expect(@comment.text).to eq('This is my first comment')
    end
  end

  describe 'Instance created with invalid attributes should not pass validations' do
    it 'should not be valid without a text' do
      @comment.text = nil
      expect(@comment).to_not be_valid
    end
  end

  describe 'Instance created with valid attributes should update post comments_counter' do
    it 'should update post comments_counter after create' do
      expect(@post.comments_counter).to eq(1)
    end

    it 'should update post comments_counter after destroy' do
      @comment.destroy
      expect(@post.comments_counter).to eq(0)
    end
  end
end
