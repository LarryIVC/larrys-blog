require 'rails_helper'

describe PostsController, type: :request do
  describe 'GET #index' do
    it 'returns a success response' do
      get '/users/:user_id/posts'
      expect(response).to be_successful
    end

    it 'should render template' do
      get '/users/:user_id/posts'
      expect(response).to render_template(:index)
    end

    it 'includes correct text in the body' do
      get '/users/:user_id/posts'
      expect(response.body).to include('Here is the post for given User')
    end
  end

  describe 'GET #show' do
    it 'return a success response' do
      get '/users/:user_id/posts/:id'
      expect(response).to be_successful
    end

    it 'should render template' do
      get '/users/:user_id/posts/:id'
      expect(response).to render_template(:show)
    end

    it 'includes correct text in the body' do
      get '/users/:user_id/posts/:id'
      expect(response.body).to include('Here is the details of given post for a given user and its comments')
    end
  end
end
