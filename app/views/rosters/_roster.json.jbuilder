json.extract! roster, :id, :first_name, :last_name, :email, :phone, :created_at, :updated_at
json.url roster_url(roster, format: :json)
