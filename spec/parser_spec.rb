require "spec_helper.rb"
require_relative "../pizzabot/Parser"

describe ".get_size_of_field" do
  context "when valid params" do
    it {expect(Parser.get_size_of_field("5x5(1, 3)(2, 4)")).to eq [5, 5]}
  end
end

describe ".get_coordinates_arr" do
  context "when valid params" do
    it {expect(Parser.get_coordinates_arr("5x5(1, 3)(2, 4)")).to eq [[1, 3], [2, 4]]}
  end
end

describe ".find_best_way" do
  context "when valid params" do
    it {expect(Parser.find_best_way([[2, 2], [0, 0], [1, 1]])).to eq [[0, 0], [1, 1], [2, 2]]}
  end
end
