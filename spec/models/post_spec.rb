require 'rails_helper'

RSpec.describe Post, type: :model do
  before(:each) do
    @user = User.create(name: 'César Herrera', photo: 'https://www.devinpucon.com', bio: 'Developer from Chile.')
    @post = Post.create(author: @user, title: 'My first post', text: 'This is my first post')
  end

  describe 'Instance created with valid attributes' do
    it 'should be valid' do
      expect(@post).to be_valid
    end

    it 'should have a title' do
      expect(@post.title).to eq('My first post')
    end

    it 'should have a text' do
      expect(@post.text).to eq('This is my first post')
    end

    it 'should have a comments_counter' do
      expect(@post.comments_counter).to eq(0)
    end

    it 'should have a likes_counter' do
      expect(@post.likes_counter).to eq(0)
    end
  end

  describe 'Instance created with invalid attributes should not pass validations' do
    it 'should not be valid without a title' do
      @post.title = nil
      expect(@post).to_not be_valid
    end

    it 'should not be valid with a title longer than 250 characters' do
      @post.title = 'a' * 251
      expect(@post).to_not be_valid
    end

    it 'should not be valid without a text' do
      @post.text = nil
      expect(@post).to_not be_valid
    end

    it 'should not be valid without a comments_counter' do
      @post.comments_counter = nil
      expect(@post).to_not be_valid
    end

    it 'should not be valid without a likes_counter' do
      @post.likes_counter = nil
      expect(@post).to_not be_valid
    end

    it 'should not be valid with a negative comments_counter' do
      @post.comments_counter = -1
      expect(@post).to_not be_valid
    end

    it 'should not be valid with a negative likes_counter' do
      @post.likes_counter = -1
      expect(@post).to_not be_valid
    end
  end

  describe 'Instance methods' do
    describe '#recent_comments' do
      it 'should return the 5 most recent comments' do
        5.times do |i|
          Comment.create(author: @user, post: @post, text: "This is comment #{i}")
        end
        expect(@post.recent_comments.count).to eq(5)
      end
    end

    describe '#update_user_posts_counter' do
      it 'should update the user posts_counter' do
        expect(@user.posts_counter).to eq(1)
        @post.destroy
        expect(@user.posts_counter).to eq(0)
      end
    end
  end
end
