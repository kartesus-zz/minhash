class Recommender
  def initialize(algorithm)
    @algorithm = algorithm
  end

  def pick(element, signatures, sets)
    a = signatures[element]

    closest = signatures
                .select {|e, b| !(sets[element] & sets[e]).empty? }
                .map    {|e, b| [e, @algorithm.new(a,b).distance] }
                .select {|e, d| e != element && d < 1 }
                .sort   {|(_,a), (_,b)| a <=> b }
                .map(&:first)
                .last

    return Set.new unless closest

    s1 = sets[element]
    s2 = sets[closest]

    return Set.new if s1 == s2

    (s1 + s2) - s1
  end
end
