class Unit

  attr_accessor :attack_power
  attr_reader :health_points

  def initialize(hp, ap)
    @health_points = hp
    @attack_power = ap
  end

  # Given an enemy, calls damage method with attack_power specified.
  def attack!(enemy)
    enemy.damage(attack_power) unless self.dead? || enemy.dead?
  end

  # When attacked with the given attack power, health points decrease by the attack power  
  def damage(attack_power)
    @health_points -= attack_power
  end

  def dead?
    @health_points <= 0
  end

end