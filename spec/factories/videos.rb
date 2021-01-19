FactoryBot.define do
  factory :video do
    video_name   {"video"}
    video_url    {"https://www.youtube.com/watch?v=abcdefghijk"}
    overview {"概要"}
    genre_id     {2}
    association  :user

    after(:build) do |video|
      video.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
