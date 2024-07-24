FactoryBot.define do
  factory :building do
    street_address { "MyString" }
    city { "MyString" }
    state { "MyString" }
    postcode { "MyString" }
    country { "MyString" }
    client { nil }
  end
end
