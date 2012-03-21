Given 'the date is $date' do |date|
  Timecop.freeze Time.parse(date).utc
end


Given 'the date continues to $date' do |date|
  Timecop.return
  step %{the date is #{date}}
end

