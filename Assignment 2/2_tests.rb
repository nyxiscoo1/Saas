require_relative '2.rb'

describe CartesianProduct do
    it "should enumerate all possible variants" do
        c = CartesianProduct.new([:a,:b], [4,5])
        c.each { |p| puts p.to_s }
        #c.each.should eq [[:a, 4], [:a, 5], [:b, 4], [:b,5]]
    end
end