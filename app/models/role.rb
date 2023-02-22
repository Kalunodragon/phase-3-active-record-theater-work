class Role <ActiveRecord::Base
  has_many :auditions

  def actors
    auditions.map {|act| act.actor}
  end

  def locations
    auditions.map {|loc| loc.location}
  end

  def lead
    answer = auditions.find_by(hired: true)
    full_answer = if answer != nil
      answer
    else
      'no actor has been hired for this role'
    end
    full_answer
  end

  def understudy
    answer = auditions.select {|a| a.hired == true} 
    full_answer = if answer.size >= 2
      answer.second
    else
      'no actor has been hired for understudy for this role'
    end
    full_answer
  end
end