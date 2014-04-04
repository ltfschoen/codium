class UsersSkills < ActiveRecord::Migration
  def change

    create_table :users_skills, :id => false do |t|
      t.integer :user_id
      t.integer :skill_id
    end

  end
end
