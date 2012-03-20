FactoryGirl.define do
  factory :deposit do
    bank_name    "Discover"
    start_date   "2010-09-10"
    term_in_days 180
  end
end