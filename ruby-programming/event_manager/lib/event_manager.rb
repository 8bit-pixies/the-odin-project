puts "EventManager Initialized!"

row_index = 0

lines = File.readlines "event_attendees.csv"
lines.each do |line|
    row_index = row_index +1
    next if row_index == 1
    columns=line.split(",")
    puts columns[2]
end
