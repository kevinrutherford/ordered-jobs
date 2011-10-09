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
    return true if @predecessor.equal?(other)
    @predecessor.depends_on?(other)
  end

  def add_to(schedule)
    schedule.insert(@predecessor) if @predecessor
    schedule.add(self)
  end

  def merge(other)
    return if @predecessor
    @predecessor = other.predecessor
  end

  def <=>(other)
    return 1 if self.depends_on?(other)
    return -1 if other.depends_on?(self)
    0
  end

end

