require 'rails_helper'

RSpec.describe Job, type: :model do
  describe 'title field validations' do
    it { should validate_presence_of(:title) }
    it { should validate_length_of(:title).is_at_most(250) }
  end
  
  describe 'description field valdiations' do
    it { should validate_presence_of(:description) }
    it { should validate_length_of(:description).is_at_least(50) }
  end
  
  describe 'company field validations' do
    it { should validate_presence_of(:company) }
    it { should validate_length_of(:company).is_at_most(50) }
  end
  
  describe 'category field validations' do
    it { should validate_presence_of(:category) }
    it do
      job_cats = %w(part-time full-time contract freelance)
      should validate_inclusion_of(:category).in_array(job_cats)
    end
  end
  
  describe 'user id field validations' do
    it { should validate_presence_of(:user_id) }
  end
end
