class ChangeSkillTypeField < ActiveRecord::Migration

  def change

	# rename column "type" to "skill_type" (as "type is a reserved word)
	# remove_column :skills, :type
	# add_column :skills, :skill_type, :string

  end

end