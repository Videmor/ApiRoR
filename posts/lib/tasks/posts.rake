require 'ffaker'

namespace :posts do

  desc 'generate data for posts'
  task generate: :environment do

    User.destroy_all
    10.times do
      user = User.create!(
        name: FFaker::Name.name,
        age: rand(10..30),
        active: true,
        username: FFaker::Internet.user_name,
        password: 'please'
      )
      puts "Create user #{user.name} "
    end


    50.times {
      Post.create!(
        name: FFaker::Company.name,
        post_url: FFaker::Internet.http_url,
        user_id: User.all.sample.id
      )
    }
  end

end
