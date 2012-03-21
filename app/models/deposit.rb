class Deposit
  include Mongoid::Document
  include Mongoid::Timestamps

  BEFORE_MAX = 10.freeze

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

  validates_presence_of :bank_name, :account_number, :start_date, :term_in_days

  # when confirm asked then start_date should be moving target and hence should be updated
  # start_date and/or term_in_days should be changed  to remove it from alert period
  def self.count_under_expiry_alert_period
    Deposit.all.map {|d| d.under_expiry_alert_period? }.reject{ |to_alert| !to_alert}.length
  end

  def under_expiry_alert_period?
    puts "Date.today is #{Date.today.inspect}"
    puts "deadline_for(BEFORE_MAX) is #{deadline_for(BEFORE_MAX).inspect}"
    puts " Date.today > deadline_for(BEFORE_MAX) is #{ Date.today > deadline_for(BEFORE_MAX)}"
    Date.today > deadline_for(BEFORE_MAX)
  end

  private

  def deadline_for(before)
    expiry_date - before.days
  end

  def expiry_date
    self.start_date + self.term_in_days.days
  end

end
