FactoryBot.define do
  factory :user do
    channel_name          {"channel"}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    channel_url           {"https://www.youtube.com/user/Channel"}
    introduction          {"説明文"}
    genre_id              {2}

    after(:build) do |user|
      user.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
