class AddFileToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :file, :string
  end
end
