class Deposit
  include Mongoid::Document
  include Mongoid::Timestamps

  BEFORE_MAX = 30.freeze

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
  field :confirmation_taken, :type => Boolean, :default => false

  # when confirm asked then start_date should be moving target and hence should be updated
  def under_expiry_alert_period?
    (Date.today > deadline_for(BEFORE_MAX) ) && !self.confirmation_taken
  end

  def deadline_for(before)
    expiry_date - before.days
  end

  def expiry_date
    self.start_date + self.term_in_days.days
  end

  def self.count_under_expiry_alert_period
    Deposit.all.map {|d| d.under_expiry_alert_period? }.reject{ |to_alert| !to_alert}.length
  end

end
