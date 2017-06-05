class RemoveLeagueIdFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :league_id, :integer
  end
end
