FactoryBot.define do

  factory :user do
    nickname              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"00000000"}
    encrypted_password    {"00000000"}
    family_name           {"赤"}
    first_name            {"青"}
    family_name_kana      {"アオ"}
    first_name_kana       {"アカ"}
    birth_date            {"1989-01-01"}
    phone_number          {"08012345645"}
    introduction          {"テスト"}

  end


end