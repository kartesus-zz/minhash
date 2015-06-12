require 'minhash'
require 'binomium'

RSpec.describe MinHash do
  before :each do
    universe = Set.new [:a, :b, :c, :d, :e]
    binomia  = [ Binomium.new(1,1), Binomium.new(3, 1)]

    @mh = MinHash.new(universe, binomia)
  end

  it "gets the same results than the book ;)" do
    s1 = Set.new [:a, :d]
    s2 = Set.new [:c]
    s3 = Set.new [:b, :d, :e]
    s4 = Set.new [:a, :c, :d]

    expect(@mh.hash(s1)).to eq(Set.new [1,0])
    expect(@mh.hash(s2)).to eq(Set.new [3,2])
    expect(@mh.hash(s3)).to eq(Set.new [0,0])
    expect(@mh.hash(s4)).to eq(Set.new [1,0])
  end
end
