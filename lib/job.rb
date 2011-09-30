class Job

  attr_reader :name

  def initialize(name)
    @name = name
  end

  def depends_on(predecessor)
    @predecessor = predecessor
  end

  def depends_on?(other)
    @predecessor && @predecessor.name == other.name
  end

  def add_to(schedule)
    schedule.add(@name)
  end

  def <=>(other)
    return 1 if self.depends_on?(other)
    return -1 if other.depends_on?(self)
    @name <=> other.name
  end

end

