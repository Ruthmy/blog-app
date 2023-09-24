require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.create(name: 'César Herrera', photo: 'https://www.devinpucon.com', bio: 'Developer from Chile.')
    @post = Post.create(author: @user, title: 'My first post', text: 'This is my first post')
  end

  describe 'Instance created with valid attributes' do
    it 'should be valid' do
      expect(@user).to be_valid
    end

    it 'should have a name' do
      expect(@user.name).to eq('César Herrera')
    end

    it 'should have a photo' do
      expect(@user.photo).to eq('https://www.devinpucon.com')
    end

    it 'should have a bio' do
      expect(@user.bio).to eq('Developer from Chile.')
    end

    it 'should have a posts_counter' do
      expect(@user.posts_counter).to eq(1)
    end
  end

  describe 'Instance created with invalid attributes should not pass validations' do
    it 'should not be valid without a name' do
      @user.name = nil
      expect(@user).to_not be_valid
    end

    it 'should not be valid without a posts_counter' do
      @user.posts_counter = nil
      expect(@user).to_not be_valid
    end

    it 'should not be valid with a negative posts_counter' do
      @user.posts_counter = -1
      expect(@user).to_not be_valid
    end
  end

  describe 'Instance methods' do
    it 'should return the 3 most recent posts' do
      3.times do |i|
        Post.create(author: @user, title: "Post #{i}", text: "This is post #{i}")
      end
      expect(@user.post_recent.count).to eq(3)
    end
  end
end
