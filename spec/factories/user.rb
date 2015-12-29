FactoryGirl.define do
  factory :user do
    name                    'William Adama'
    email                   'none1@none.com'
    password                'password'
    password_confirmation   'password'
  end
  
  factory :helper_user, :parent => :user do
    name                    'Lee Adama'
    email                   'none2@none.com'
  end
  
  factory :jobs_user, :parent => :user do
    name                    'Kara Thrace'
    email                   'none3@none.com'
  end
  
  factory :session_user, :parent => :user do
    name                    'Gaius Baltar'
    email                   'none4@none.com'
  end
end