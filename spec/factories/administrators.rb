FactoryBot.define do
  factory :administrator do
    sequence :email do |n|
      "test#{n}@example.com"
    end

    name { "Admin" }
    password { "aaaa1234" }
    uid { email }
  end
end
