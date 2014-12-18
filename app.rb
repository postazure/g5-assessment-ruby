require_relative "./lib/poem_charter"

poem_hash = {}

file_names = Dir["./data/*"]

file_names.each do |file_name|

  title = false
  author = false
  line_count = 0
  verse_count = 0

  f = File.open(file_name, "r")
  f.each_line do |line|

    if title == false
      title = line.chomp
      next
    end

    if author == false
      author = line.chomp
      next
    end

    if line == "\n"
      verse_count += 1
      next
    end

    line_count += 1

  end

  if poem_hash.has_key?(author)
    poem_hash[author].merge!({
      title => {
        verses: verse_count,
        lines: line_count,
      }
    })


  else
    poem_info ={
      author => {
        title => {
          verses: verse_count,
          lines: line_count,
        }
      }
    }

    poem_hash.merge!(poem_info)
  end
end


p poem_hash
