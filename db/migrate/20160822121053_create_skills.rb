class CreateSkills < ActiveRecord::Migration[5.0]
  def change
    create_table :skills do |t|
      t.string :name
      t.integer :value
      t.integer :user_id

      t.timestamps
    end

    remove_column :users, :skills, :string
  end
end
