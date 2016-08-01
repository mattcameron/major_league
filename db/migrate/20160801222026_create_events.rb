class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :event_date
      t.text :description
      t.integer :address_id
      t.text :favourites

      t.timestamps
    end
  end
end
