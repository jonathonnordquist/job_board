FactoryGirl.define do
  factory :job do
    title                             Faker::Lorem.words(5)
    company                           Faker::Company.name
    description                       Faker::Lorem.paragraph(3)
    user_id                           1
  end
  
  factory :part_time_job, :parent => :job do
    category                          'part-time'
  end
  
  factory :full_time_job, :parent => :job do
    category                          'full-time'
  end
  
  factory :contract_job, :parent => :job do
    category                          'contract'
  end
  
  factory :freelance_job, :parent => :job do
    category                          'freelance'
  end
end