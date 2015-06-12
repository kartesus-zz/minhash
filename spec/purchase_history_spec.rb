require 'purchase_history'

RSpec.describe PurchaseHistory do
  before :each do
    @ph = PurchaseHistory.new [
      [1,12], [1,99], [1,32],
      [2,32], [2,77], [2,54], [2,66],
      [3,99], [3,42], [3,12], [3,32],
      [4,77], [4,66], [4,47],
      [5,65]
    ]
  end

  it "extracts list of products" do
    expect(@ph.products).to eq(Set.new [12, 32, 42, 47, 54, 65, 66, 77, 99])
  end

  it "extracts users' purchase history" do
    expect(@ph.users).to eq({
      1 => Set.new([12, 32, 99]),
      2 => Set.new([32, 54, 66, 77]),
      3 => Set.new([12, 32, 42, 99]),
      4 => Set.new([47, 66, 77]),
      5 => Set.new([65])
    })
  end
end
