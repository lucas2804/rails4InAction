# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ticket do
    title "Ticket titile"
    name "Ticket Name"
    description "Ticket Description"
  end
end
