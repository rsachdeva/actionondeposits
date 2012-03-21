require "minitest_helper"

describe DepositsController do

  describe "#get" do
    before do
      Timecop.travel(2008, 10, 5) do
        Deposit.create!(bank_name: "Discover", phone_number: "1-800-253-2737", account_number: "1234", fixed_income_account_type: "CD",
                      amount: "17452.50", term_in_days: 365, apr: 3.25, compounding_times:2, start_date: Date.today,
                      comment: "I like this Bank")
      end
      get :index
    end
    it { must_respond_with :success }
  end

end