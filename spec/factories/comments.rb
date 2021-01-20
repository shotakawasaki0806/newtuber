FactoryBot.define do
  factory :comment do
    text        {"コメント"}
    association :user
    association :video
  end
end
