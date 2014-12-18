require_relative "./lib/poem_charter"
require "json"

file_names = Dir["./data/*.txt"]
file_names.each do |file_name|
  puts file_name
end
