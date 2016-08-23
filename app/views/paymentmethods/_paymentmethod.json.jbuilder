json.extract! paymentmethod, :id, :name, :description, :created_at, :updated_at
json.url paymentmethod_url(paymentmethod, format: :json)