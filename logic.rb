require_relative "Parser.rb"

class PizzaBot
    attr_accessor(:size_of_field_x, :size_of_field_y, :coordinates)

    def initialize(size_of_field_x, size_of_field_y, coordinates)
        @size_of_field_x = size_of_field_x
        @size_of_field_y = size_of_field_y
        @coordinates = coordinates
        
    end

    def self.get_navigation(given_str)                           
        size_of_field = Parser.get_size_of_field(given_str)
        @size_of_field_x, @size_of_field_y = size_of_field[0], size_of_field[1]

        @coordinates = Parser.get_coordinates_arr(given_str)
    end

    def self.deliver_pizza
        current_coordinates = [0, 0]
        original_coordinates = [0, 0]
        path = ""
        @coordinates.each do |i|
            until current_coordinates[0] == i[0]
                i[0] > current_coordinates[0] ? current_coordinates[0] += 1 : current_coordinates[0] -= 1
            end
            until current_coordinates[1] == i[1]
                i[1] > current_coordinates[1] ? current_coordinates[1] += 1 : current_coordinates[1] -= 1
            end
            original_coordinates[0] < current_coordinates[0] ? path += "E" * (current_coordinates[0] - original_coordinates[0]).abs : path += "W" * (original_coordinates[0] - current_coordinates[0]).abs
            original_coordinates[1] < current_coordinates[1] ? path += "N" * (current_coordinates[1] - original_coordinates[1]).abs : path += "S" * (original_coordinates[1] - current_coordinates[1]).abs
            original_coordinates[0], original_coordinates[1] = current_coordinates[0], current_coordinates[1]
            path += "D"
        end
        path
    end
end
