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
  
  factory :mailer_user, :parent => :user do
    name                    'Number Six'
    email                   'none10@none.com'
  end
end