class AddProviderToUsers < ActiveRecord::Migration
  def change
    add_column :users_skills, :uid, :integer
  end
end
