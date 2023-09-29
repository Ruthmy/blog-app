require 'rails_helper'

RSpec.describe 'Users', type: :request do
  before(:all) do
    @user = User.create(name: 'César Herrera', photo: 'https://i.pravatar.cc/150?img=3', bio: 'I am a developer')
    @posts = Post.create(author_id: @user.id, title: 'My first post', text: 'This is my first post')
  end

  describe 'GET /index' do
    # If response status was correct.
    it 'should respond with 200 (status was correct)' do
      get "/users/#{@user.id}/posts"
      expect(response).to have_http_status(200)
    end

    # If a correct template was rendered for the index action.
    it 'should render the index template' do
      get "/users/#{@user.id}/posts"
      expect(response).to render_template(:index)
    end

    it 'does not render a different template' do
      get "/users/#{@user.id}/posts"
      expect(response).to_not render_template(:show)
    end

    # If the response body includes correct placeholder text for the index action.
    it 'should include correct placeholder text in the response body' do
      get "/users/#{@user.id}/posts"
      expect(response.body).to include('index post')
    end
  end

  describe 'GET /users/:id/posts/:id' do
    # If response status was correct.
    it 'should respond with 200 (status was correct)' do
      get "/users/#{@user.id}/posts/#{@posts.id}"
      expect(response).to have_http_status(200)
    end

    # If a correct template was rendered.
    it 'should render the show template' do
      get "/users/#{@user.id}/posts/#{@posts.id}"
      expect(response).to render_template(:show)
    end

    it 'does not render a different template' do
      get "/users/#{@user.id}/posts/#{@posts.id}"
      expect(response).to_not render_template(:index)
    end

    # If the response body includes correct placeholder text.
    it 'should include correct placeholder text in the response body' do
      get "/users/#{@user.id}/posts/#{@posts.id}"
      expect(response.body).to include('Show/Deatils post')
    end
  end
end
