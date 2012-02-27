require 'anagrams.rb'

describe "combine_anagrams" do
    it "should combine anagrams" do
        input = ['cars', 'for', 'potatoes', 'racs', 'four', 'scar', 'creams', 'scream']
        output = [['cars', 'racs', 'scar'], ['for'], ['potatoes'], ['four'], ['creams', 'scream']]
        combine_anagrams(input).should eql(output)
    end
end