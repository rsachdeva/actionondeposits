Given 'the date is $date' do |date|
  Timecop.freeze Time.parse(date).utc
end

