require_relative 'spec_helper'

describe Unit do

  describe "initialization" do

    it "requires HP and AP instead of defaulting them" do
      unit = Unit.new(30, 5)
    end

  end

  describe "#health_points" do

    before :each do
      @unit = Unit.new(30, 5)
    end

    it "can be retrieved (read)" do
      expect(@unit.health_points).to eq(30)
    end

    it "cannot be set (written) once initialized" do
      expect { @unit.health_points = 500 }.to raise_error(NoMethodError)
    end

  end

  describe "#damage" do

    before :each do
      @unit = Unit.new(100, 5)
    end

    it "should reduce the unit's health_points by the attack_power specified" do
      @unit.damage(12)
      expect(@unit.health_points).to eq(88)
    end

  end

  describe "#attack!" do

    before :each do
      @unit = Unit.new(40, 5)
    end
    
    it "should deal the appropriate (attack power based) damage to the enemy unit" do
      enemy_unit = Unit.new(40, 5)
      expect(enemy_unit).to receive(:damage).with(5)
      @unit.attack!(enemy_unit)
    end

    it 'will return a falsey value if the enemy is dead.' do
      enemy = Unit.new(0, 10)
      expect(@unit.attack!(enemy)).to be_falsey
    end

    it 'will return a falsey value if the unit is dead' do
      enemy = Unit.new(100, 10)
      @unit.damage(100)
      expect(@unit.attack!(enemy)).to be_falsey
    end

  end

  describe '#dead?' do

    before :each do
      @unit = Unit.new(100, 10)
    end

    it 'returns a value of false if the HP of the unit is greater than zero' do
      expect(@unit.dead?).to be_falsey
    end

    it 'returns a value of true if the HP of the unit is at or below zero.' do
      @unit.damage(100)
      expect(@unit.dead?).to be_truthy
    end

  end

end