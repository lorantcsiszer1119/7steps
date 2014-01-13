json.array!(@openings) do |opening|
  json.extract! opening, :user_id, :link
  json.url opening_url(opening, format: :json)
end
