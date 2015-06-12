class Jaccard
  def initialize(a,b)
    @a = a
    @b = b
  end

  def similarity
    (@a & @b).size.to_f / (@a + @b).size.to_f
  end

  def distance
    1 - similarity
  end
end
