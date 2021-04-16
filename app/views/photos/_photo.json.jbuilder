json.extract! photo, :id, :photo_name, :photo_title, :created_at, :updated_at
json.url photo_url(photo, format: :json)
