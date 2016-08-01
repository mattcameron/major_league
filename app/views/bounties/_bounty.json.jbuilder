json.extract! bounty, :id, :event_id, :value, :name, :user_id, :created_at, :updated_at
json.url bounty_url(bounty, format: :json)