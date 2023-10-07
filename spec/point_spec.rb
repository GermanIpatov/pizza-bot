require "spec_helper.rb"
require_relative "../pizzabot/Point"

describe ".to_point" do
  context "when valid params" do
    it {expect(Point.to_point([[1, 3], [2, 4]])) === [Point.new(1, 3), Point.new(2, 4)]}
  end
end
