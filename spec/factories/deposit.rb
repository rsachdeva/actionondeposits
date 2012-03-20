FactoryGirl.define do
  factory :deposit do
    bank_name "Ing Direct"
    phone_number "1-800-254-2737"
    account_number "9876"
    fixed_income_account_type "Savings"
    amount "17452.50"
    term_in_days 365
    apr 1.25
    compounding_times 365
    start_date (Date.today - 12.days)
    comment "Nice rate achieved"
  end
end