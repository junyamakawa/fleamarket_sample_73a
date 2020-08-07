FactoryBot.define do

  factory :image do
    src              {"istockphoto-1184184060-170667a.jpg"}
    association :product
  end

end