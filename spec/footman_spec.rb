require_relative 'spec_helper'

describe Footman do

    before :each do
      @footman = Footman.new
    end

    describe '#initialize' do

      it "should be a Unit" do
        expect(@footman).to be_an_instance_of(Footman)
        expect(@footman).to be_a(Unit)
      end

      it "has and knows its HP (health points)" do
        expect(@footman.health_points).to eq(60)
      end

      it "has and knows its AP (attack power)" do
        expect(@footman.attack_power).to eq(10)
      end

    end

    describe '#attack' do

      it "should deal 10 (AP) damage to the enemy unit" do
        enemy = Footman.new
        expect(enemy).to receive(:damage).with(10)
        @footman.attack!(enemy)
      end

      it 'should reduce health_points by HALF the attack power (5 AP) if the enemy is of the Class Barracks' do
        enemy = Barracks.new
        expect(enemy).to receive(:damage).with(5)
        @footman.attack!(enemy)
      end

    end

  end