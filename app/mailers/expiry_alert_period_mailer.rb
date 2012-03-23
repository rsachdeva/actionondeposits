class ExpiryAlertPeriodMailer < ActionMailer::Base
  default from: "growth@drinnovations.us"

  def expiry_email
    mail(:to => "deepikarohit@yahoo.com", :subject => "Maturing Deposits: Please confirm action so you don't loose money!'")
  end
end
