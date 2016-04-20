class Bacon

  attr_accessor :expired

  def self.saved?
    true
  end
  def edible?
    !expired
  end

  def expired!
    self.expired = true
  end
end