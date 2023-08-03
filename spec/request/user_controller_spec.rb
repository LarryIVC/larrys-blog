require 'rails_helper'

describe UsersController, type: :request do
  describe 'GET #index' do
    it 'returns a success response' do
      get '/users'
      expect(response).to be_successful
    end

    it 'should render template' do
      get '/users'
      expect(response).to render_template(:index)
    end

    it 'includes correct text in the body' do
      get '/users'
      expect(response.body).to include('Here is the list of Users')
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      get '/users/:id'
      expect(response).to be_successful
    end

    it 'should render template' do
      get '/users/:id'
      expect(response).to render_template(:show)
    end

    it 'includes correct text in the body' do
      get '/users/:id'
      expect(response.body).to include('Here details for a given user')
    end
  end
end
