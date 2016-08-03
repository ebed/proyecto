json.array!(@contactypes) do |contactype|
  json.extract! contactype, :id, :name
  json.url contactype_url(contactype, format: :json)
end
