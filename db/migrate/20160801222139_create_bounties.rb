class CreateBounties < ActiveRecord::Migration[5.0]
  def change
    create_table :bounties do |t|
      t.integer :event_id
      t.integer :value
      t.string :name
      t.integer :user_id

      t.timestamps
    end
  end
end
