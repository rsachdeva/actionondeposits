class JobExpiryAlertEmail
  def self.perform
    ExpiryAlertPeriodMailer.expiry_email.deliver if Deposit.count_under_expiry_alert_period > 0
  end
end