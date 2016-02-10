require_relative 'spec_helper'

describe SiegeEngine do 

  before :each do 
    @siegeengine = SiegeEngine.new
  end

  describe '#initialize' do

    it "should be a Unit" do
      expect(@siegeengine).to be_an_instance_of(SiegeEngine)
      expect(@siegeengine).to be_a(Unit)
    end

    it 'should initially have an attack power of 50' do
      expect(@siegeengine.attack_power).to eq(50)
    end

    it 'should initially have 400 health points' do
      expect(@siegeengine.health_points).to eq(400)
    end

  end

  describe '#attack' do

    it 'should not attack if it is dead (i.e. health points is less than or equal to zero)' do
      enemy = Barracks.new
      @siegeengine.damage(400)
      expect(@siegeengine.dead?).to be_truthy
      expect(@siegeengine.attack!(enemy)).to be_falsey
    end

    it 'should reduce enemy health points by DOUBLE the attack power if the enemy is of the class Barracks' do
      enemy = Barracks.new
      expect(enemy).to receive(:damage).with(100)
      @siegeengine.attack!(enemy)
    end

    it 'should return a falsey value if it the enemy is not of the Class Barracks or SiegeEngine' do
      enemy = Unit.new(100, 10)
      expect(@siegeengine.attack!(enemy)).to be_falsey
    end

    it 'should reduce enemy health points by the attack power if the enemy is of the class SiegeEngine' do
      enemy = SiegeEngine.new
      expect(enemy).to receive(:damage).with(50)
      @siegeengine.attack!(enemy)
    end

  end

end 
