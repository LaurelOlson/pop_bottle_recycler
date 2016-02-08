class RecyclingInventory
  attr_accessor :empty_bottles, :bottle_caps, :free_bottles
  def initialize
    @empty_bottles = 0
    @bottle_caps = 0
    @free_bottles = 0
  end
end