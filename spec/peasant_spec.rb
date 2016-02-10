require_relative 'spec_helper'

describe Peasant do

  before :each do
    @peasant = Peasant.new
  end

  describe '#initialize' do

    it "should be a Unit" do
      expect(@peasant).to be_an_instance_of(Peasant)
      expect(@peasant).to be_a(Unit)
    end

    it "has and knows its HP, which is lower than that of a Footman" do
      expect(@peasant.health_points).to eq(35)
    end

    it "can't damage other units (no attack power)" do
      expect(@peasant.attack_power).to eq(0)
    end

  end

end
