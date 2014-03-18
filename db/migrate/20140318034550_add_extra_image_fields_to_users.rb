class AddExtraImageFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :image_file_name, :string
    add_column :users, :image_content_type, :string
    add_column :users, :image_file_size, :integer
    add_column :users, :image_uploaded_at, :datetime
  end
end
