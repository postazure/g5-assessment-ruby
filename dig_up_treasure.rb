require_relative "./lib/poem_charter"
require 'json'

poem_data =  PoemCharter.new("./data/*").run
puts poem_data

File.open("poem_data.json", "w") do |f|
  f.write(poem_data.to_json)
end

# Expected Output
# {
#   "William Butler Yeats"=>{
#     "A Drinking Song"=>{
#       :verses=>1,
#       :lines=>6
#     },
#     "A Cradle Song"=>{
#       :verses=>1,
#       :lines=>12
#     }
#   },
#   "Walt Whitman"=>{
#     "Aboard At A Ship's Helm"=>{
#       :verses=>5,
#       :lines=>11
#     }
#   },
#   "Robert Lee Frost"=>{
#     "The Lockless Door"=>{
#       :verses=>5,
#       :lines=>20
#     },
#     "A Brook In The City"=>{
#       :verses=>1,
#       :lines=>9
#     },
#     "A Cliff Dwelling"=>{
#       :verses=>1,
#       :lines=>13
#     }
#   },
#   "Henry Lawson"=>{
#     "As far As Your Rifles Cover"=>{
#       :verses=>2,
#       :lines=>8
#     },
#     "I'll Tell You What You Wanderers"=>{
#       :verses=>1,
#       :lines=>8
#     },
#     "In Possum Land"=>{
#       :verses=>2,
#       :lines=>8
#     }
#   }
# }
