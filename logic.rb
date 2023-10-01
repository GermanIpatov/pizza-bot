class PizzaBot
    attr_accessor(:size_of_field_x, :size_of_field_y, :coordinates)

    def initialize(size_of_field_x, size_of_field_y, coordinates)
        @size_of_field_x = size_of_field_x
        @size_of_field_y = size_of_field_y
        @coordinates = coordinates
        
    end

    def self.get_navigation(given_str)
        size_of_field_arr = given_str.strip.slice(0...given_str.index("(")).tr("x", " ").split(" ").map{|i| i.to_i}
        @size_of_field_x, @size_of_field_y = size_of_field_arr[0], size_of_field_arr[1]
        @coordinates = given_str.slice(given_str.index("(") + 1...given_str.length - 1).split(")(").map{|i| i.split(", ")}.each{|i| i[0], i[1] = i[0].to_i, i[1].to_i}
    end


    def self.mooving
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
        print path
    end
end
