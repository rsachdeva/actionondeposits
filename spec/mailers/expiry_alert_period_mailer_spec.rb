require "minitest_helper"

describe ExpiryAlertPeriodMailer do

  describe "attributes getting saved" do
    before do
      Timecop.travel(2007, 9, 25) do
        Deposit.create!(bank_name: "Discover", phone_number: "1-800-253-2737", account_number: "1234", fixed_income_account_type: "CD",
                        amount: "17452.50", term_in_days: 365, apr: 3.25, compounding_times:2, start_date: Date.today + 1.day,
                        comment: "I like this Bank")
      end
    end
    subject { ExpiryAlertPeriodMailer.expiry_email.deliver }

    it "includes proper email subject" do
      subject.subject.must_equal "Maturing Deposits: 1 out of 1 require confirmation"
      ActionMailer::Base.deliveries.empty?.must_equal false
      subject.encoded.must_match /\<li class=\"BankPhone\"\>/
      subject.encoded.must_match /Bank Contact Phone: 1-800-253-2737/
    end
  end
end