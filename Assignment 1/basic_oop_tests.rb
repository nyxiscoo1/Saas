require 'basic_oop.rb'

describe Dessert do
    it "should define getters and setters for name and calories" do
        dessert = Dessert.new "TestName1", 190
        dessert.name.should eql("TestName1")
        dessert.calories.should eql(190)
        
        dessert.name = "NewTestName"
        dessert.name.should eql("NewTestName")
        
        dessert.calories = 253
        dessert.calories.should eql(253)
    end
    
    it "healthy? should be true if calories is less then 200" do
        dessert = Dessert.new "TestName1", 190
        dessert.healthy?.should be_true
        
        dessert2 = Dessert.new "TestName2", 290
        dessert2.healthy?.should be_false
    end
    
    it "delicious? should return true for all desserts" do
        dessert = Dessert.new "Dessert1", 190
        dessert.delicious?.should be_true
        
        dessert2 = Dessert.new "Dessert2", 456
        dessert2.delicious?.should be_true
    end
end

describe JellyBean do
    it "should override delicious? and reurn false if flavor is black licorice" do
        jelly_bean = JellyBean.new "TestDessert", 290, "Black licorice"
        jelly_bean.delicious?.should be_false
        
        jelly_bean2 = JellyBean.new "TestDessert", 290, "Test flavor"
        jelly_bean2.delicious?.should be_true
    end
    
    it "should define getter and setter for flavor" do
        jelly_bean = JellyBean.new "TestDessert", 290, "Black licorice"
        jelly_bean.name.should eql("TestDessert")
        jelly_bean.calories.should eql(290)
        jelly_bean.flavor.should eql("Black licorice")
        
        jelly_bean.flavor = "new flavor"
        jelly_bean.flavor.should eql("new flavor")
    end
end