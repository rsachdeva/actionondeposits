class Deposit
  include Mongoid::Document
  include Mongoid::Timestamps

  field :bank_name, :type => String
  field :account_number, :type => String
  field :phone_number, :type => String
  field :fixed_income_account_type
  field :amount, :type => BigDecimal
  field :term_in_days, :type => Integer
  field :apr, :type => BigDecimal
  field :compounding_times, :type => Integer
  field :apy, :type => BigDecimal
  field :start_date, :type => Date
  field :comment, :type => String
end
