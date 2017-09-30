class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :main_image
      t.text :description
      t.references :user, foreign_key: true
      t.date :established_at
      t.boolean :is_published, default: false
      t.string :url
      t.string :organization

      t.timestamps
    end
    add_index :projects, [:title, :user_id], :unique => true
  end
end