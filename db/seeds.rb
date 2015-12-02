job_cats = %w(part-time full-time contract freelance)

5.times do |x|
  User.create(email:                  "none#{x}@none.com",
              name:                   Faker::Name.name,
              password:               "password",
              password_confirmation:  "password")
end

30.times do |x|
  job_cats.each do |cat|
    job = Job.new(title:         Faker::Lorem.sentence(5),
               company:          Faker::Company.name,
               description:      Faker::Lorem.paragraph(6),
               category:         cat)
    job.save
  end
end