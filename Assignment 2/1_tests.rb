require_relative '1.rb'

describe "palindrome?" do
    it "should match first" do
        ('A man, a plan, a canal -- Panama'.palindrome?).should eq(true)
    end
    
    it "should match second" do
        ('Madam, I`m Adam!'.palindrome?).should be(true)
    end
    
    it "should match third" do
        ('Abracadabra'.palindrome?).should be(false)
    end
end

describe "palindrome? for emun" do
    it "should work for arrays" do
        ([1,2,3].palindrome?).should eq(false)
        ([1, 2, 3, 2, 1].palindrome?).should eq(true)
    end
    
    it "should not throw for hashes" do
        ({'1' => 1, '2' => 2, '1' => 1}.palindrome?).should be(false)
    end
    
    it "should work for iterators" do
        (1...11).palindrome?
    end 
end

describe "currencies" do
    it "should convert dollars to euros" do
        factor = 1.292
        (5.dollars.in(:euros)).should eq 5 / factor
        (1.dollar.in(:euro)).should eq 1 / factor
        
        (5.euros.in(:dollars)).should eq 5 * factor
        (1.euro.in(:dollar)).should eq 1 * factor
    end   
    
    it "should convert rupees to dollars" do
        factor = 0.019
        (5.dollars.in(:rupees)).should eq 5 / factor
        (1.dollar.in(:rupee)).should eq 1 / factor
        
        (5.rupees.in(:dollars)).should eq 5 * factor
        (1.rupee.in(:dollar)).should eq 1 * factor
    end 
    
    it "should convert yens to dollars" do
        factor = 0.013
        (5.dollars.in(:yens)).should eq 5 / factor
        (1.dollar.in(:yen)).should eq 1 / factor
        
        (5.yens.in(:dollars)).should eq 5 * factor
        (1.yen.in(:dollar)).should eq 1 * factor
    end
    
    it "should convert dollars to dollars" do
        factor = 1
        (5.dollars.in(:dollars)).should eq 5 / factor
        (1.dollar.in(:dollar)).should eq 1 / factor
    end
end