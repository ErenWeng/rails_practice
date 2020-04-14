FactoryBot.define do
  factory :item do  #檔案名
    name { Faker::Name.name }
    price{ Faker::Number.between(from: 50, to: 300) }
    category
    # category { Factory.}
  end
end

