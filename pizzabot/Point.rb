class Point
  attr_accessor(:x, :y)
  def initialize(x, y)
    @x = x
    @y = y
  end

	def self.to_point(arr)
    arr.map{|i| i = Point.new(i[0], i[1])}
  end

end
