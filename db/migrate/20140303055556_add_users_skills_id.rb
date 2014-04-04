class AddUsersSkillsId < ActiveRecord::Migration
  def change
  	add_column :users_skills, :id, :integer
  end
end
