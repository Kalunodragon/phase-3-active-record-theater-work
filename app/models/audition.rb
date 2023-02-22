class Audition < ActiveRecord::Base
  belongs_to :role

  def call_back
    update(hired: true)
  end

  def call_again
    update(hired: false)
  end

  def check_hired
    answer = self.hired
    result = answer == true ? "Already been hired!" : "Still looking for a job!"
    result
  end
end