class Job < ActiveRecord::Base
  belongs_to :user


  def active?
    self.deadline > Date.today
  end

end
