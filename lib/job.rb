class Job

  attr_reader :name, :predecessor

  def initialize(name)
    @name = name
  end

  def depends_on(predecessor)
    @predecessor = predecessor
  end

  def depends_on?(other)
    return false unless @predecessor
    @predecessor.equal?(other) || @predecessor.depends_on?(other)
  end

  def <=>(other)
    return 1 if self.depends_on?(other)
    return -1 if other.depends_on?(self)
    0
  end

end

