json.extract! attendence, :id, :datee, :check_in, :check_out, :status, :user_id, :created_at, :updated_at
json.url attendence_url(attendence, format: :json)
