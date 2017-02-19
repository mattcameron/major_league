class RemoveAdminIdFromLeagues < ActiveRecord::Migration[5.0]
  def change
    remove_column :leagues, :admin_id, :integer
  end
end
