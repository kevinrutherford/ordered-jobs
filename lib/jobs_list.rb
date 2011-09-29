class JobsList

  def initialize(spec)
    instructions = spec.split("\n")
    @jobs = instructions.map {|s| s[0]}
  end

  def sequence
    @jobs
  end

end

