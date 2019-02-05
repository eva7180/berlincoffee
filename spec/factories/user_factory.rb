FactoryBot.define do

  sequence :email do |n|
    "email#{n}@test.com"
  end

  factory :user do
    email
    password { "1234567890" }
    first_name { "Paul" }
    last_name { "Example" }

    factory :admin_user do
      first_name { "Admin"}
      admin { true }
    end
  end
end