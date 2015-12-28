require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validation for' do
    describe 'name' do
      let(:name) { :name }
      let(:max_length) { 70 }
      
      it 'verifies presence' do
        should validate_presence_of(name)
      end
      
      it 'verifies max length of #{max_length}'do
        should validate_length_of(name).is_at_most(max_length)
      end
    end
    
    describe 'email' do
      let(:email) { :email }
      let(:max_length) { 255 }
      
      it 'verifies presence' do
        should validate_presence_of(email)
      end
      
      it 'verifies max length of #{max_length}' do
        should validate_length_of(email).is_at_most(max_length)
      end
      it 'verifies only valid format' do
        should allow_value('none@none.com').for(email)
        should_not allow_value('none@none').for(email)
        should_not allow_value('none.com').for(email)
        should_not allow_value('none @none.com').for(email)
        should_not allow_value('none@none .com').for(email)
        should_not allow_value('none@@none.com').for(email)
        should_not allow_value('none@none..com').for(email)
      end
      
      # subject { FactoryGirl.build(:user) }
      it 'verifies uniqueness' do
        should validate_uniqueness_of(email).case_insensitive
      end
    end
    
    describe 'password' do
      let(:password) { :password }
      let(:pass_length) { 6 }
      
      it 'verifies presence' do
        should validate_presence_of(password)
      end
      
      it 'verifies min length of #{pass_length}' do
        should validate_length_of(password).is_at_least(pass_length)
      end
    end
  end
end
