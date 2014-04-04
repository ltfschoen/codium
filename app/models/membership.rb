class Membership < ActiveRecord::Base
  belongs_to :member, class_name: 'User', foreign_key: 'member_id'
  belongs_to :project

  validates :member_id, presence: true
  validates :project_id, presence: true

end
