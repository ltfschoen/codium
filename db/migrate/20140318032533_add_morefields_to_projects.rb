class AddMorefieldsToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :description, :text
    add_column :projects, :url, :string
    add_column :projects, :image, :string
  end
end
