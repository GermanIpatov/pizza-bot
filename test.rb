require_relative "pizzabot/Point"



def check_coord_and_field(x, y, coords)

  coords.each do |i|
    if i.x > x || i.y > y
      return false
    end
  end
  true
end

coord = [Point.new(0, 9)]
p check_coord_and_field(4, 3, coord)
