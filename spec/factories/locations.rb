FactoryBot.define do
  factory :location do
    street_address { "MyString" }
    city { "MyString" }
    state { "MyString" }
    postcode { "MyString" }
    country { "MyString" }
    building { nil }
  end
end
