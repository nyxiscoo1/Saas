def palindrom?(str)
    downcased = str.gsub(/\W/, '').downcase()
    downcased == downcased.reverse()
end

def word_count(str)
    Hash[str.gsub(/\W/, ' ').downcase.split.group_by{|x| x}.collect{|x| [x[0], x[1].length]}]
end

if __FILE__ == $0
    puts word_count ARGV[0].chomp
end