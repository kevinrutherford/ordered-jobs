class JobsList

  def initialize(spec)
    @instructions = spec.split("\n").map {|s| s[0]}
  end

  def add_to(schedule)
    @instructions.each {|i| schedule.add(i) }
  end

end

