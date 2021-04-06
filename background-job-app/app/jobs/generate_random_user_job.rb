class GenerateRandomUserJob < ApplicationJob
  queue_as :default

  def perform(*args)
    user = User.new
    user.firstname = Faker::Name.first_name
    user.lastname = Faker::Name.last_name
    user.email = Faker::Internet.email
    user.save!
    sleep 2
  end
end
