class SiegeEngine < Unit

  def initialize
    super(400, 50)
  end

  def attack!(enemy)
    if enemy.is_a? (Barracks)
      enemy.damage(attack_power * 2) unless self.dead?
    elsif enemy.is_a? (SiegeEngine)
      enemy.damage(attack_power) unless self.dead?
    end
  end

end