require './lib/instruction'
require './lib/job'

class Roster

  def initialize(spec)
    @jobs = {}
    instructions = spec.split("\n")
    instructions.map {|instr| Instruction.parse(instr, self) }
  end

  def job(name)
    @jobs.fetch(name) { create_job(name) }
  end

  def add_to(schedule)
    @jobs.each_value {|job| job.add_to(schedule) }
  end

  def ordered_jobs
    @jobs.values.sort
  end

private

  def create_job(name)
    @jobs[name] = Job.new(name)
  end

end

