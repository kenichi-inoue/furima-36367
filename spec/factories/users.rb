FactoryBot.define do
  factory :user do
    transient do
      gimei { Gimei.name } 
    end

    nickname { Faker::Name.first_name }
    email { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 6)
    password { password }
    password_confirmation { password }

    user_family_name { gimei.last.kanji }
    user_first_name { gimei.first.kanji }
    katakana_user_family_name { gimei.last.katakana }
    katakana_user_first_name { gimei.first.katakana }
    birthday { Faker::Date.between(from: '1930-01-01', to: '2016-12-31') }
  end
end