FactoryBot.define do
  factory :comment do
    content {"ああああああああ"}
    association :user
    association :post
  end
end
