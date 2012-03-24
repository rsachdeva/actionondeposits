# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


#field :bank_name
#field :account_number
#field :fixed_income_account_type
#field :amount, :type => BigDecimal
#field :term_in_days, :type => Integer
#field :apr, :type => BigDecimal
#field :compounding_times, :type => Integer
#field :apy, :type => BigDecimal
#field :start_date, :type => Date

Deposit.delete_all
require 'timecop'
Timecop.travel(Date.today - 375.days) do
  Deposit.create!(bank_name: "Discover", bank_website: "http://www.discover.com", phone_number: "1-800-253-2737", account_number: "1234", fixed_income_account_type: "CD",
                  amount: "17452.50", term_in_days: 365, apr: 3.25, compounding_times:2, start_date: Date.today,
                  comment: "I like this Bank")
end

Timecop.travel(Date.today - 12.days) do
  Deposit.create!(bank_name: "Ing Direct", bank_website: "http://www.ingdirect.com", phone_number: "1-800-254-2737", account_number: "9876", fixed_income_account_type: "Savings",
                  amount: "17452.50", term_in_days: 365, apr: 1.25, compounding_times:365, start_date: Date.today,
                  comment: "Nice rate achieved")
end

Timecop.travel(Date.today - 115.days) do
  Deposit.create!(bank_name: "Wells fargo", bank_website: "http://www.wellsfargo.com", phone_number: "1-800-254-2737", account_number: "9872", fixed_income_account_type: "CD",
                  amount: "1000", term_in_days: 120, apr: 2.25, compounding_times:365, start_date: Date.today,
                  comment: "Better rate")
end
