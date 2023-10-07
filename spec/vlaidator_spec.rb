require "spec_helper.rb"
require_relative "../pizzabot/validator"
require_relative "../pizzabot/logic"

describe ".check_field" do
  
  context "when valid params" do
    before do
      MyValidator.set_input("5x5(1, 3)(2, 4)")
    end
    it {expect(MyValidator.check_field).to eq true}
  end
  context "when invalid params" do
    before do
      MyValidator.set_input("0x0(1, 3)(2, 4)")
    end
    it {expect(MyValidator.check_field).to eq false}
  end
end

describe ".check_coord_and_field" do
  context "when valid params" do
    before do
      MyValidator.set_input("5x5(1, 3)(2, 4)")
    end
    it {expect(MyValidator.check_coord_and_field).to eq true}
  end
  context "when invalid params" do
    before do
      MyValidator.set_input("5x5(1, 7)(2, 4)")
    end
    let (:coord) { [Point.new(1, 7), Point.new(1, 4)] }
    it {expect(MyValidator.check_coord_and_field).to eq false}
  end
end

describe ".check_input" do
  context "when valid params" do
    it {expect(MyValidator.check_input("5x5(1, 3)(2, 4)")).to eq true}
  end
  context "when invalid params" do
    it {expect(MyValidator.check_input("5x5   (1, 7)(1, 4)")).to eq false}
  end
end

describe ".get_navigation" do
  context "when valid params" do
    it {expect(PizzaBot.get_navigation("5x5(1, 3)(2, 4)")) === [Point.new(1, 3), Point.new(2, 4)]}
  end
end

describe ".deliver_pizza" do
  before do
    PizzaBot.instance_variable_set(:@coordinates, [Point.new(1, 3), Point.new(2, 4)])
  end
  context "when valid params" do
    it {expect(PizzaBot.deliver_pizza).to eq "ENNNDEND"}
  end
end

describe ".check" do
  context "when valid params" do
    before do
      MyValidator.set_input("5x5(1, 3)(2, 4)")
    end
    it {expect(MyValidator.check("5x5(1, 3)(2, 4)")).to eq ''}
  end
  context "when invalid field" do
    before do
      MyValidator.set_input("0x0(1, 7)(1, 4)")
    end
    it {expect(MyValidator.check("0x0(1, 7)(1, 4)")).to eq "Field can't be smaller than 1x1"}
  end
  context "when invalid coordinates and field" do
    before do
      MyValidator.set_input("5x5(1, 7)(1, 4)")
    end
    it {expect(MyValidator.check("5x5(1, 7)(1, 4)")).to eq "Coordinates are out of field"}
  end
  context "when invalid format of string" do
    before do
      MyValidator.set_input("5x5   (1, 3)(1, 4)")
    end
    it {expect(MyValidator.check("5x5   (1, 3)(1, 4)")).to eq "Invalid format of input"}
  end
end
