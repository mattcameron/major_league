json.extract! event, :id, :name, :event_date, :description, :address_id, :favourites, :created_at, :updated_at
json.url event_url(event, format: :json)