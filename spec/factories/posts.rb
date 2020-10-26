FactoryBot.define do
  factory :post do
    title {"テストタイトル"}
    detail {"テスト投稿文章"}
    association :user
  end
end
