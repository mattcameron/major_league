class AddHostedEventIdToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :hosted_event_id, :integer
  end
end
