class AddSnsColumnToProject < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :twitter, :string
    add_column :projects, :facebook, :string
  end
end
