Given /^I confirm deposit "([^"]*)" of "([^"]*)" with start date as "([^"]*)" for a term of "([^"]*)" days$/ do |account_number, bank_name, start_date, term_in_days|
  d = Deposit.where({:account_number => account_number, :bank_name => bank_name}).first
  d.start_date = Time.parse(start_date)
  d.term_in_days = term_in_days
  d.save!
end



