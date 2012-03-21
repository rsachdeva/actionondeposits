require "minitest_helper"

describe Deposit do

  after { Timecop.return }

  describe "attributes getting saved" do
    before { Timecop.freeze(2007, 9, 25) }
    subject { Deposit.create!(bank_name: "Discover", phone_number: "1-800-253-2737", account_number: "1234", fixed_income_account_type: "CD",
                          amount: "17452.50", term_in_days: 365, apr: 3.25, compounding_times:2, start_date: Date.today + 1.day,
                          comment: "I like this Bank") }
    it "includes name" do
      subject.bank_name.must_equal "Discover"
    end

    it "has proper start date" do
      subject.start_date.to_s.must_equal "2007-09-26"
    end
  end

  describe "#under_expiry_alert_period?" do
    let(:deposit) do
          Deposit.create!(bank_name: "Discover", phone_number: "1-800-253-2737", account_number: "1234", fixed_income_account_type: "CD",
                        amount: "17452.50", term_in_days: 90, apr: 3.25, compounding_times:2, start_date: Date.today + 2.days,
                        comment: "I like this Bank")
    end

    before do
      Timecop.travel(2007, 10, 5) { deposit }
      Timecop.freeze(2008, 1, 5)
    end
    it "alerts the expiry" do
      deposit.under_expiry_alert_period?.must_equal true
    end
  end

  describe ".count_under_expiry_alert_period" do
    before do
      Timecop.travel(2007, 10, 5) do
        Deposit.create!(bank_name: "Discover", phone_number: "1-800-253-2737", account_number: "1234", fixed_income_account_type: "CD",
                        amount: "17452.50", term_in_days: 365, apr: 3.25, compounding_times:2, start_date: Date.today + 2.days,
                        comment: "I like this Bank")
      end

      Timecop.travel(2008, 2, 5) do
        Deposit.create!(bank_name: "Discover", phone_number: "1-800-253-2737", account_number: "1234", fixed_income_account_type: "CD",
                        amount: "17452.50", term_in_days: 365, apr: 3.25, compounding_times:2, start_date: Date.today + 2.days,
                        comment: "I like this Bank")
      end

      Timecop.travel(2007, 2, 5) do
        Deposit.create!(bank_name: "Discover", phone_number: "1-800-253-2737", account_number: "1234", fixed_income_account_type: "CD",
                        amount: "17452.50", term_in_days: 365, apr: 3.25, compounding_times:2, start_date: Date.today,
                        comment: "I like this Bank")
      end

      Timecop.freeze(2008, 10, 15)
    end
    it "gives total count of expired alter period deposits" do
      Deposit.count_under_expiry_alert_period.must_equal 2
    end
  end

  describe "#start_date" do
    let(:deposit) do
          Deposit.new(bank_name: "Discover", phone_number: "1-800-253-2737", account_number: "1234", fixed_income_account_type: "CD",
                        amount: "17452.50", term_in_days: 90, apr: 3.25, compounding_times:2, start_date: Date.today - 10.days,
                        comment: "I like this Bank")
    end

    it "must not be valid" do
      Timecop.freeze(2008, 10, 15)
      deposit.valid?.must_equal false
    end
  end

end
