require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { :users_cont_user }
  it 'new method renders the new view' do
    get :new
    
    expect(response).to have_http_status(200)
    expect(response).to render_template(:new)
  end
  
  describe 'create method' do
    
    
    it 'when given valid information creates a new user, logs in and redirects to user show page' do
      no_users = User.count
      post :create, :user => FactoryGirl.attributes_for(user)

      expect(User.count).to eq(no_users + 1)
      expect(flash[:success]).to eq "Your account has been created"
      expect(session[:user_id]).to eq User.last.id
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(:action => :show, :id => User.last.id)
    end
    
    it 'when given invalid information does not create a user and renders the new page' do
      no_users = User.count
      post :create, :user => FactoryGirl.attributes_for(:invalid_user)
      
      expect(User.count).to eq(no_users)
      expect(flash[:success]).to be nil
      expect(response).to have_http_status(200)
      expect(response).to render_template(:new)
    end
  end
  
  it 'show method renders the user profile view' do
    post :create, :user => FactoryGirl.attributes_for(user)
    session[:user_id] = User.last.id
    get(:show, :id => User.last.id)
    
    expect(response).to have_http_status(200)
    expect(response).to render_template(:show)
  end
end
