require "minitest_helper"

describe Deposit do
  before { Timecop.freeze(2008, 10, 5) }
  after { Timecop.return }
  it "includes name in" do
    d = Deposit.create!(bank_name: "Discover", phone_number: "1-800-253-2737", account_number: "1234", fixed_income_account_type: "CD",
                    amount: "17452.50", term_in_days: 365, apr: 3.25, compounding_times:2, start_date: Date.today - 375.days,
                    comment: "I like this Bank")
    d.bank_name.must_equal "Discover"
    d.start_date.to_s.must_equal "2007-09-26"
  end
end
