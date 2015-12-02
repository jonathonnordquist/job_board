class Job < ActiveRecord::Base
  belongs_to :user
  
  validates :title, presence: true, length: { maximum: 250 }
  validates :description, presence: true, length: { minimum: 50 }
  validates :company, presence: true, length: {maximum: 50 }
  validates :category, presence: true, 
                      inclusion: { in: %w(part-time full-time contract freelance) }
  validates :user_id, presence: true
end
