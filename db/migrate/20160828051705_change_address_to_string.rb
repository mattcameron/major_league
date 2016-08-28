class ChangeAddressToString < ActiveRecord::Migration[5.0]
  def change
    remove_column :events, :address_id, :integer
    add_column :events, :address, :string
  end
end
