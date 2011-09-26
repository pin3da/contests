class Submission < ActiveRecord::Base
  belongs_to :contest
  belongs_to :problem
  belongs_to :team
  
  validates_presence_of :verdict
  validates_presence_of :language
  validates_presence_of :run_time
  validates_presence_of :submitted_at
  validates_presence_of :team_id
  validates_presence_of :contest_id
  validates_presence_of :problem_id
  validates_presence_of :judge_identifier
  validates_uniqueness_of :judge_identifier
  
  def accepted?
    verdict == "Accepted"
  end
end