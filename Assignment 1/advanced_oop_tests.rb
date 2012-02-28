require 'advanced_oop.rb'

describe "attr_accessor_with_history" do
    it "should track attribute value history" do
        class Foo
            attr_accessor_with_history :bar
        end

        foo = Foo.new
        foo.bar = 1
        foo.bar = "a"
        foo.bar = [1, "_", nil]
        foo.bar = nil

        foo.bar_history.should eql([nil, 1, "a", [1, "_", nil], nil])
    end
    
    it "should track history separate for each instance" do
        class Foo
            attr_accessor_with_history :bar
        end
        
        foo1 = Foo.new
        foo1.bar = 1
        
        foo2 = Foo.new
        foo2.bar = "qwe"
        foo2.bar = 2
        
        foo1.bar_history.should eql([nil, 1])
        foo2.bar_history.should eql([nil, "qwe", 2])
    end
end