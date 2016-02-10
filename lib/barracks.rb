class Barracks

  attr_reader :gold, :food, :health_points, :lumbar

  def initialize
    @gold = 1000
    @food = 80
    @lumbar = 500
    @health_points = 500
  end

  def can_train_footman?
    self.food >= 2 && self.gold >= 135
  end

  def train_footman
    if can_train_footman?
      @gold -= 135
      @food -= 2
      Footman.new
    end
  end

  def can_train_peasant?
    self.food >= 5 && self.gold >= 90
  end

  def train_peasant
    if can_train_peasant?
      @gold -= 90
      @food -= 5
      Peasant.new
    end
  end

  def can_train_siegeengine?
    self.food >= 3 && self.lumbar >= 60 && self.gold >= 200
  end

  def train_siegeengine
    if can_train_siegeengine?
      @gold -= 200
      @lumbar -= 60
      @food -=3
      SiegeEngine.new
    end
  end

  def damage(attack_power)
    @health_points -= attack_power
  end

end
