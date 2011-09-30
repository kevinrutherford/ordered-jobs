class Job

  attr_reader :name

  def initialize(name)
    @name = name
  end

  def add_to(schedule)
    schedule.add(@name)
  end

  def <=>(other)
    @name <=> other.name
  end

end

