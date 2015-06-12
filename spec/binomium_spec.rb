require 'binomium'

RSpec.describe Binomium do

  it "solves for x" do
    # ax + b where a = 2, b = 3, x = 5
    expect(Binomium.new(2,3).solve_for(5)).to eq(13)
  end

end
