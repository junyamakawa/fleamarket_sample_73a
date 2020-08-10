FactoryBot.define do

  factory :user do
    nickname              {"Dog"}
    email                 {"aa@gmail.com"}
    password              {"aaaaaaaa"}
    encrypted_password    {"aaaaaaaa"}
    family_name           {"小野"}
    first_name            {"淳也"}
    family_name_kana      {"オノ"}
    first_name_kana       {"ジュンヤ"}
    birth_date            {"19891018"}
    phone_number          {"08000000000"}
    introduction          {"Hello World"}
  end

end