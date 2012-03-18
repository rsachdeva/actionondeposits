require "minitest_helper"

describe Deposit do
  before { Timecop.freeze(2008, 10, 5) }
  after { Timecop.return }

  describe "attributes" do
    subject { Deposit.create!(bank_name: "Discover", phone_number: "1-800-253-2737", account_number: "1234", fixed_income_account_type: "CD",
                          amount: "17452.50", term_in_days: 365, apr: 3.25, compounding_times:2, start_date: Date.today - 375.days,
                          comment: "I like this Bank") }
    it "includes name in" do
      subject.bank_name.must_equal "Discover"
      subject.start_date.to_s.must_equal "2007-09-26"
    end
  end

  describe "#under_expiry_alert_period?" do
    subject {Deposit.create!(bank_name: "Discover", phone_number: "1-800-253-2737", account_number: "1234", fixed_income_account_type: "CD",
                          amount: "17452.50", term_in_days: 365, apr: 3.25, compounding_times:2, start_date: Date.today - 375.days,
                          comment: "I like this Bank")}
    it "#under_expiry_alert_period?" do
      subject.under_expiry_alert_period?.must_equal true
    end
  end

end
