require 'set'

class Schedule

  def initialize
    @jobs = []
  end

  def add(job)
    if @jobs.include?(job)
      existing = @jobs.select {|j| j == job}.first
      existing.merge(job)
    else
      @jobs << job
    end
  end

  def insert(job)
    if @jobs.include?(job)
      existing = @jobs.select {|j| j == job}.first
      existing.merge(job)
    else
      @jobs.insert(0, job)
    end
  end

  def ordered_jobs
    @jobs.sort
  end
end

