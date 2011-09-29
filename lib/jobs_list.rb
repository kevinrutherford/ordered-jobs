class JobsList

  def initialize(spec)
    dependencies = spec.split("\n")
    @jobs = dependencies.map {|s| s[0]}
  end

  def sequence
    @jobs
  end

end

