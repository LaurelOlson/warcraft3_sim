require_relative 'spec_helper'

describe Barracks do

  before :each do
    @barracks = Barracks.new
  end

  describe '#intialize' do

    it "starts off with 1000 gold resources" do
      expect(@barracks.gold).to eq(1000)
    end

    it "starts off with 80 food resources" do
      expect(@barracks.food).to eq(80)
    end

    it 'should start off with 500 lumbar resources' do
      expect(@barracks.lumbar).to eq(500)
    end

    it 'should start off with 500 health points' do
      expect(@barracks.health_points).to eq(500)
    end

  end

  describe "#can_train_footman?" do

    it "returns true if there are enough resources to train a footman" do
      expect(@barracks.can_train_footman?).to be_truthy
    end
    
    it "returns false if there isn't enough food" do
      expect(@barracks).to receive(:food).and_return(1)
      expect(@barracks.can_train_footman?).to be_falsey
    end

    it "returns false if there isn't enough gold" do
      expect(@barracks).to receive(:gold).and_return(134)
      expect(@barracks.can_train_footman?).to be_falsey
    end

  end

  describe "#train_footman" do

    it "does not train a footman if there aren't enough resources" do
      expect(@barracks).to receive(:can_train_footman?).and_return(false)
      expect(@barracks.train_footman).to be_nil
    end

    it "trains a footman if there are enough resources" do
      expect(@barracks).to receive(:can_train_footman?).and_return(true)
      expect(@barracks.train_footman).to be_a(Footman)
    end

    it "costs 135 gold" do
      @barracks.train_footman
      expect(@barracks.gold).to eq(865) # starts at 1000
    end

    it "costs 2 food" do
      @barracks.train_footman
      expect(@barracks.food).to eq(78) # starts at 80
    end

    it "produces a footman unit" do
      footman = @barracks.train_footman
      expect(footman).to be_an_instance_of(Footman)
    end

  end

  describe "#can_train_peasant?" do

    it "returns true if there are enough resources to train a peasant" do
      expect(@barracks.can_train_peasant?).to be_truthy
    end

    it "returns false if there isn't enough food" do
      expect(@barracks).to receive(:food).and_return(4)
      expect(@barracks.can_train_peasant?).to be_falsey
    end

    it "returns false if there isn't enough gold" do
      expect(@barracks).to receive(:gold).and_return(89)
      expect(@barracks.can_train_peasant?).to be_falsey
    end

  end

  describe "#train_peasant" do

    it "does not train a peasant if there aren't enough resources" do
      expect(@barracks).to receive(:can_train_peasant?).and_return(false)
      expect(@barracks.train_peasant).to be_nil
    end

    it "trains a peasant if there are enough resources" do
      expect(@barracks).to receive(:can_train_peasant?).and_return(true)
      expect(@barracks.train_peasant).to be_a(Peasant)
    end

    it "costs 90 gold" do
      @barracks.train_peasant
      expect(@barracks.gold).to eq(910) # starts at 1000
    end

    it "costs 5 food" do
      @barracks.train_peasant
      expect(@barracks.food).to eq(75) # starts at 80
    end

    it "produces a peasant unit" do
      peasant = @barracks.train_peasant
      expect(peasant).to be_an_instance_of(Peasant)
    end

  end

  describe '#can_train_siegeengine' do

    it 'returns true if there are enough resources to train a siege engine' do
      expect(@barracks.can_train_siegeengine?).to be_truthy
    end

    it 'returns false if there are is enough gold to train a siege engine' do
      expect(@barracks).to receive(:gold).and_return(190)
      expect(@barracks.can_train_siegeengine?).to be_falsey
    end

    it 'returns false if there is not enough lumbar to train a siege engine' do
      expect(@barracks).to receive(:lumbar).and_return(55)
      expect(@barracks.can_train_siegeengine?).to be_falsey
    end

    it 'returns false if there are is enough food to train a siege engine' do
      expect(@barracks).to receive(:food).and_return(2)
      expect(@barracks.can_train_siegeengine?).to be_falsey
    end    

  end

  describe '#train_siegeengine' do

    before :each do
      @barracks.train_siegeengine
    end

    it "does not train a siegeengine if there aren't enough resources" do
      expect(@barracks).to receive(:can_train_siegeengine?).and_return(false)
      expect(@barracks.train_siegeengine).to be_nil
    end

    it "trains a siegeengine if there are enough resources" do
      expect(@barracks).to receive(:can_train_siegeengine?).and_return(true)
      expect(@barracks.train_siegeengine).to be_a(SiegeEngine)
    end

    it 'cost 200 gold' do
      expect(@barracks.gold).to eq(800)
    end

    it 'cost 60 lumbar' do
      expect(@barracks.lumbar).to eq(440)
    end

    it 'cost 3 food' do
      expect(@barracks.food).to eq(77)
    end

    it "produces a siege engine unit" do
      siegeengine = @barracks.train_siegeengine
      expect(siegeengine).to be_an_instance_of(SiegeEngine)
    end

  end

  describe '#damage' do

    it 'should reduce the Barracks\' health_points by the attack_power specified' do
      @barracks.damage(5)
      expect(@barracks.health_points).to eq(495)
    end

  end

end