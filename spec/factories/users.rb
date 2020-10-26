FactoryBot.define do
  factory :user do
    email {"aaa@ccc.jp"}
    password {"qwer1234"}
    name {"鈴木太郎"}
    specialize {"整形外科"}
    experience {4}
    word {"基礎に自信があります。"}
  end
end
