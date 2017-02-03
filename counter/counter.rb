class Counter
  def initialize(start=0)
    @n = start
  end

  def up
    @n += 1
  end

  def count
    @n
  end

  def reset
    @n = 0
  end

end
