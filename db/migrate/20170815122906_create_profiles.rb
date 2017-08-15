class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.references :user
      t.string :name
      t.integer :term

      t.timestamps
    end
  end
end
