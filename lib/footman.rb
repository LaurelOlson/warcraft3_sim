# http://classic.battle.net/war3/human/units/footman.shtml

class Footman < Unit
  attr_writer :health_points

  def initialize
    super(60, 10)
  end

end
