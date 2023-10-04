require_relative "Parser"
require_relative "Point"
require_relative "validator"

class PizzaBot
 
  def self.get_navigation(given_str)                           
    @size_of_field_x, @size_of_field_y = MyValidator.size_of_field_x, MyValidator.size_of_field_y
    @coordinates = MyValidator.coordinates
  end

  def self.deliver_pizza
    @current = Point.new(0, 0)
    @original = Point.new(0, 0)
    @path = ""
    @coordinates.each{|i| aim(i)}
    @path                                    
  end

  def self.aim(goal)
    @original.x, @original.y = @current.x, @current.y    
    until @current.x == goal.x
      goal.x > @current.x ? @current.x += 1 : @current.x -= 1
    end
    until @current.y == goal.y
      goal.y > @current.y ? @current.y += 1 : @current.y -= 1
    end
    @original.x < @current.x ? @path += "E" * (@current.x - @original.x).abs : @path += "W" * (@original.x - @current.x).abs
    @original.y < @current.y ? @path += "N" * (@current.y - @original.y).abs : @path += "S" * (@original.y - @current.y).abs
    @path += "D"
  end

end
