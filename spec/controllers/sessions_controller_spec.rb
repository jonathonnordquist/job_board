require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  before(:all) do
    @user = FactoryGirl.build(:session_user)
    @user.save
  end
  
  let(:user) { @user }
  
  it 'new method renders new view' do
    get :new
    
    expect(response).to have_http_status(200)
    expect(response).to render_template(:new)
  end
  
  describe 'create method' do
    it 'with valid information creates a new session' do
      post :create, :session => {
                      email: user.email,
                      password: user.password
                      }
      
      expect(session[:user_id]).to eq User.last.id
      expect(flash[:error]).to be nil
      expect(response).to have_http_status(302)
      expect(response).to redirect_to "/users/#{User.last.id}"
    end
    
    it 'with invalid information does not create new session' do
      post :create, :session => {
                      email: user.email,
                      password: "wrong_password"
                      }

      expect(session[:user_id]).to be nil
      expect(flash[:error]).to eq("Username or password is incorrect")
      expect(response).to have_http_status(200)
      expect(response).to render_template :new
    end
  end
  
  it 'destroy method removes sessiona and redirects to root' do
    post :create, :session => {
                      email: user.email,
                      password: user.password
                      }
    expect(session[:user_id]).to eq(User.last.id)
    
    delete :destroy
    
    expect(session[:user_id]).to be nil
    expect(response).to have_http_status(302)
    expect(response).to redirect_to "/"
  end
end
