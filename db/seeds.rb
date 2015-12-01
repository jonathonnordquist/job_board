job_cats = %w(part-time full-time contract freelance)

30.times do |x|
  job_cats.each do |cat|
    job = Job.new(title:         Faker::Lorem.sentence(5),
               company:          Faker::Company.name,
               description:      Faker::Lorem.paragraph(6),
               category:         cat)
    job.save
  end
end