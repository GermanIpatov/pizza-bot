require_relative "Parser"

class MyValidator

  @@size_of_field_x = 0
  @@size_of_field_y = 0
  @@coordinates = []
  

  def self.size_of_field_x
    @@size_of_field_x
  end

  def self.size_of_field_y
    @@size_of_field_y
  end

  def self.coordinates
    @@coordinates
  end





  HASH = {0 => "Field can't be smaller than 1x1", 1 => "Coordinates can't be negative", 2 => "Coordinates are out of field", 3 => "Invalid format of input"}

  def self.check(given_str)
    if check_input(given_str) == false 
      HASH[3]
    elsif check_field(given_str) == false
      HASH[0]
    elsif check_coordinates(given_str) == false
      HASH[1]
    elsif check_coord_and_field(@@size_of_field_x, @@size_of_field_y, @@coordinates) == false
      HASH[2]
    else
      ''
    end
  end



  def self.check_field(given_str)
    size_of_field = Parser.get_size_of_field(given_str)
    @@size_of_field_x, @@size_of_field_y = size_of_field
    false unless @@size_of_field_x > 0 && @@size_of_field_y > 0  
  end 

  def self.check_coordinates(given_str)
    @@coordinates = Point.to_point(Parser.get_coordinates_arr(given_str))
    @@coordinates.each do |i| 
      if i.x < 0 || i.y < 0
        false
      end   
    end 
    true 
  end

  def self.check_coord_and_field(x, y, coords)
    coords.each do |i|
      if i.x > x || i.y > y
        false
      end
    end
    true
  end

  def self.check_input(given_str)
    false unless given_str.match?(/(\d+x\d+)(\(\d+\, \d+\))+/)
  end
  
end


