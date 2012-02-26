require 'fun_with_strings.rb'

describe "palindrom?" do
    it "should match first" do
        (palindrom? 'A man, a plan, a canal -- Panama').should eq(true)
    end
    
    it "should match second" do
        (palindrom? 'Madam, I`m Adam!').should be(true)
    end
    
    it "should match third" do
        (palindrom? 'Abracadabra').should be(false)
    end
end

describe "word_count" do
    it "should match first" do
        (word_count 'A man, a plan, a canal -- Panama').should eq({'a' => 3, 'man' => 1, 'canal' => 1, 'panama' => 1, 'plan' => 1})
    end
    
    it "should match second" do
        (word_count 'Doo bee doo bee doo').should eq({'doo' => 3, 'bee' => 2})
    end
    
    it "should match third" do
        ({'1' => 1, '2' => 2}).should eq({'1' => 1, '2' => 2})
    end
end