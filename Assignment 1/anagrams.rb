def combine_anagrams(words)
    words.group_by {|x| x.downcase.chars.sort}.values
end