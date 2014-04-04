class UsersSkill < ActiveRecord::Base
  validates_uniqueness_of :skill_id, :scope => :user_id

  belongs_to :user
  belongs_to :skill

end