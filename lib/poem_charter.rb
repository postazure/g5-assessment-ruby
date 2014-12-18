class PoemCharter
  def initialize(dir = "../data/*")
    @dir = dir
    @poem_hash = {}
  end

  def run
    file_names.each do |file_name|
      poem_stats = get_poem_stats(file_name)
      log_poem(poem_stats)
    end

    @poem_hash
  end

  def file_names
    Dir[@dir]
  end

  def get_poem_stats(file_name)
    poem_info = {
      title: false,
      author: false,
      line_count: 0,
      verse_count: 0,
    }

    f = File.open(file_name, "r")
    f.each_line do |line|

      if poem_info[:title] == false
        poem_info[:title] = line.chomp
        next
      elsif poem_info[:author] == false
        poem_info[:author] = line.chomp
        next
      elsif line == "\n"
        poem_info[:verse_count] += 1
        next
      end

      poem_info[:line_count] += 1
    end

    poem_info
  end

  def log_poem(poem_stats)
    poem_data = {
      poem_stats[:title] => {
        verses: poem_stats[:verse_count],
        lines: poem_stats[:line_count],
      }
    }

    if @poem_hash.has_key?(poem_stats[:author])
      @poem_hash[poem_stats[:author]].merge!(poem_data)
    else
      @poem_hash.merge!({poem_stats[:author] => poem_data})
    end
  end
end
