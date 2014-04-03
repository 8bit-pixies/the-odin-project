require "csv"
require 'sunlight/congress'

Sunlight::Congress.api_key = "27d1271a79644030b32e0583c89fa9d7"

def clean_zipcode(zipcode)
    zipcode.to_s.rjust(5,"0")[0..4]
end

def legislators_by_zipcode(zipcode)
    legislators = Sunlight::Congress::Legislator.by_zipcode(zipcode)
    legislator_names = legislators.collect do |legislator|
        "#{legislator.first_name} #{legislator.last_name}"
    end
    
    return legislator_names.join(", ")
end


puts "EventManager Initialized!"

contents = CSV.open "event_attendees.csv", headers: true, header_converters: :symbol
contents.each do |row|
    name = row[:first_name]
    zipcode = clean_zipcode(row[:zipcode])
    
    legislators_string = legislators_by_zipcode(zipcode)
    
    puts "#{name} #{zipcode} [#{legislators_string}]"
end
