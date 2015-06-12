class PurchaseHistory
  attr_accessor :products, :users
  def initialize(history)
    @products = history.map(&:last).sort.to_set
    @users = history.reduce({}) do |col, (u, p)|
      col[u] = Set.new unless col[u]
      col.merge!({ u => col[u].add(p) })
    end
  end
end
