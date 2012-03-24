class ExpiryAlertPeriodMailer < ActionMailer::Base
  default from: "growth@drinnovations.us"

  def expiry_email
    @deposits = Deposit.all
    mail(:to => "deepikarohit@yahoo.com", :subject => "Maturing Deposits: #{Deposit.count_under_expiry_alert_period} out of #{Deposit.count} require confirmation")
  end
end
