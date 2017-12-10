FactoryBot.define do
  factory :reminder do
    trait :standard_event do
      what { "An incredible thing to behold" }
      where { "Wherever you want" }
      time { Date.today }
    end
  end
end
