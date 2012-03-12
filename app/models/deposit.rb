class Deposit
  include Mongoid::Document
  include Mongoid::Timestamps

  field :bank_name
  field :account_number
  field :fixed_income_account_type
  field :amount, :type => BigDecimal
  field :term_in_days, :type => Integer
  field :apr, :type => BigDecimal
  field :compounding_times, :type => Integer
  field :apy, :type => BigDecimal
  field :start_date, :type => Date
end
