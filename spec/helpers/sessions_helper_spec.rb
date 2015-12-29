require 'rails_helper'

RSpec.describe SessionsHelper, type: :helper do
  let(:user) {FactoryGirl.build(:helper_user) }
  before(:each) do
    user.save
  end
  
  it 'log_in method sets session :user_id value to users id and current_user to the user object' do
    expect(session[:user_id]).to be nil

    helper.log_in(user)
    expect(session[:user_id]).to eq(user[:id])
    expect(helper.current_user).to eq(user)
  end
  
  describe 'when logged in' do
    before(:each) do
      helper.log_in(user)
    end
    
    it 'current_user returns logged in user' do
      expect(helper.current_user).to eq(user)
    end
    
    it 'log_out method clears current user and removes user id from session' do
      helper.log_out
      expect(session[:user_id]).to be nil
      expect(@current_user).to be nil
    end
    
    it 'logged_in? method returns true' do
      expect(logged_in?).to be true
    end
  end
  
  describe 'when not logged in' do
    it 'current user returns nil' do
      expect(helper.current_user).to be nil
    end
    
    it 'logged_in? method returns false' do
      expect(logged_in?).to be false
    end
  end
end
