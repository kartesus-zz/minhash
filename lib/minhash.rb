class MinHash
  def initialize(universe, binomia)
    @universe = universe
    @binomia  = binomia
    @size     = universe.size
  end

  def hash(set)
    @binomia.map do |binomium|
      @universe.each_with_index.map do |element, i|
        set.member?(element) ? binomium.solve_for(i) % @size : Float::INFINITY
      end.min
    end.to_set
  end
end
