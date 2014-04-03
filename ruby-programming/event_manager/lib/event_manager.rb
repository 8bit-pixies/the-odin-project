require "csv"
require 'sunlight/congress'
require 'erb'

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

template_letter = File.read "form_letter.erb"
erb_template = ERB.new template_letter

contents = CSV.open "event_attendees.csv", headers: true, header_converters: :symbol
contents.each do |row|
  id = row[0]
  name = row[:first_name]

  zipcode = clean_zipcode(row[:zipcode])

  legislators = legislators_by_zipcode(zipcode)

  form_letter = erb_template.result(binding)

  Dir.mkdir("output") unless Dir.exists? "output"

  filename = "output/thanks_#{id}.html"

  File.open(filename,'w') do |file|
    file.puts form_letter
  end

end