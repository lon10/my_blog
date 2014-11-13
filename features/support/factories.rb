FactoryGirl.define do

  factory :post do
    title 'title_ololo'
    text 'text_ololo'
    published true
  end

  factory :comment do
    name 'some_name'
    text 'some_text'
  end

  factory :user do
    trait :with_admin_role do
      name 'admin'
      email 'admin@example.com'
      password 'password'
    end
  end

end