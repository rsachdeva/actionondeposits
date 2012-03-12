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
Deposit.create(bank_name: "Discover", account_number: "1234", fixed_income_account_type: "CD", amount: "17452.50", term_in_days: 365, apr: 3.25, compounding_times:2, start_date: Date.today - 10.days )
Deposit.create(bank_name: "Ing Direct", account_number: "9876", fixed_income_account_type: "Savings", amount: "17452.50", term_in_days: 365, apr: 1.25, compounding_times:365, start_date: Date.today- 12.days )