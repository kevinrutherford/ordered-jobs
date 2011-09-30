class Schedule

  def initialize
    @jobs = []
  end

  def add(job)
    @jobs << job
  end

  def ordered_jobs
    @jobs.sort
  end
end

