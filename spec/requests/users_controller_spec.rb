require 'rails_helper'

RSpec.describe 'Users', type: :request do
  before(:all) do
    @user = User.create(name: 'César Herrera', photo: 'https://i.pravatar.cc/150?img=3', bio: 'I am a developer')
  end

  describe 'GET /index' do
    # If response status was correct.
    it 'should respond with 200 (status was correct)' do
      get '/users'
      expect(response).to have_http_status(200)
    end

    # If a correct template was rendered for the index action.
    it 'should render the index template' do
      get '/users'
      expect(response).to render_template(:index)
    end

    it 'does not render a different template' do
      get '/users'
      expect(response).to_not render_template(:show)
    end

    # If the response body includes correct placeholder text for the index action.
    it 'should include correct placeholder text in the response body' do
      get '/users'
      expect(response.body).to include('Index Users')
    end
  end

  describe 'GET /users/:id' do
    it 'should respond with 200 when the user is found' do
      get "/users/#{@user.id}"
      expect(response).to have_http_status(200)
    end

    it 'should respond with home made 404 when the user is not found' do
      get '/users/999' # Assuming 999 is an ID that doesn't exist
      expect(response.body).to include('404 - User not found')
    end

    it 'should render the show template when the user is found' do
      get "/users/#{@user.id}"
      expect(response).to render_template(:show)
    end

    it 'does not render a different template when the user is found' do
      get "/users/#{@user.id}"
      expect(response).to_not render_template(:index)
    end

    it 'should include the user details in the response body when the user is found' do
      get "/users/#{@user.id}"
      expect(response.body).to include(@user.name)
      expect(response.body).to include(@user.photo)
      expect(response.body).to include(@user.bio)
    end
  end
end
