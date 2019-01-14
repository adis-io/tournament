class IdsRandomizer
  def initialize(ids)
    @random_ids = ids.shuffle
  end

  def first8
    @random_ids.first(8)
  end

  def last8
    @random_ids.last(8)
  end
end
