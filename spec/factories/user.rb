FactoryGirl.define do
  factory :user do
    name                    'William Adama'
    email                   'none@none.com'
    password                'password'
    password_confirmation   'password'
  end
end