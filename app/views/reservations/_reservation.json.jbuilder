json.extract! reservation, :id, :seats, :room_id, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)
