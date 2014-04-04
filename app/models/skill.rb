class Skill < ActiveRecord::Base
  validates :name, presence: true 

  has_many :users_skills
  has_many :users, :through => :users_skills #, :uniq => true

end
