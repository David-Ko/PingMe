FactoryBot.define do
  factory :user do
    first_name { "MyString" }
    last_name { "MyString" }
    email { "MyString" }
    password_digest { "MyString" }
    profession { "MyString" }
    current_latitude { "9.99" }
    current_longitude { "9.99" }
    meetup_latitude { "9.99" }
    meetup { "" }
  end
end
