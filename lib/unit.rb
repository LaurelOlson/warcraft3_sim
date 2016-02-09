class Unit
  attr_accessor :attack_power
  attr_reader :health_points

  def initialize(hp, ap)
    @health_points = hp
    @attack_power = ap
  end

  def attack!(enemy)
    enemy.damage(attack_power)
  end

  def damage(attack_power)
    @health_points -= attack_power
  end
end