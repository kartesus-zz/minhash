require 'recommender'
require 'jaccard'

RSpec.describe Recommender do
  before :each do
    @r = Recommender.new(Jaccard)
  end

  it "returns emtpy when there is no similar signature" do
    signatures = { a: Set.new([0, 0]), b: Set.new([5, 5]) }
    sets = {}
    recommendation = @r.pick(:a, signatures, sets)

    expect(recommendation).to be_empty
  end

  it "returns empty when sets are equal" do
    signatures = { a: Set.new([0, 0]), b: Set.new([0, 0]) }
    sets = { a: Set.new([1,2,3]), b: Set.new([1,2,3]) }
    recommendations = @r.pick(:a, signatures, sets)

    expect(recommendations).to be_empty
  end

  it "returns difference with most similar set" do
    signatures = {
      a: Set.new([0, 0]),
      b: Set.new([0, 3]),
      c: Set.new([5, 5])
    }

    sets = {
      a: Set.new([1,3,5]),
      b: Set.new([1,2,3,4,5,6]),
      c: Set.new([1,2,4,8])
    }

    recommendations = @r.pick(:a, signatures, sets)

    expect(recommendations).to eq(Set.new([2,4,6]))
  end
end
