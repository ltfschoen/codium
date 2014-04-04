class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :name
      t.string :type
      t.integer :level

      t.timestamps
    end
  end
end
