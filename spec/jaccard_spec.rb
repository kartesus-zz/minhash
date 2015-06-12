require 'jaccard'

RSpec.describe Jaccard do
  context "when both sets are empty" do
    before :each do
      @j = Jaccard.new Set.new, Set.new
    end

    it "returns NaN for similarity" do
      expect(@j.similarity).to be_nan
    end

    it "returns NaN for distance" do

      expect(@j.distance).to be_nan
    end
  end
  context "when sets are the same" do
    before :each do
      @j = Jaccard.new Set.new([1,2,3,4]), Set.new([1,2,3,4])
    end

    it "has similarity 1" do
      expect(@j.similarity).to eq(1)
    end

    it "has distance 0" do
      expect(@j.distance).to eq(0)
    end
  end

  context "when sets has no common element" do
    before :each do
      @j = Jaccard.new Set.new([1,2,3,4]), Set.new([5,6,7,8])
    end

    it "has similarity 0 " do
      expect(@j.similarity).to eq(0)
    end

    it "has distance 1" do
      expect(@j.distance).to eq(1)
    end

  end

  context "when the sets have half elements in common" do
    before :each do
      @j = Jaccard.new Set.new([1,2,3,4]), Set.new([3,4,5,6])
    end

    it "has similarity between 0 and 1 " do
      expect(@j.similarity).to be > 0
      expect(@j.similarity).to be < 1
    end


    it "has distance between 0 and 1 " do
      expect(@j.distance).to be > 0
      expect(@j.distance).to be < 1
    end
  end
end
