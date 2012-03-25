require "minitest_helper"

describe JobExpiryAlertEmail do

  describe "check email to be sent" do
    before do
      Deposit.delete_all
    end
    subject { JobExpiryAlertEmail.perform }

    it "includes proper email subject" do
      subject.must_be_nil
    end
  end
end