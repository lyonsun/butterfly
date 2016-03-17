json.array!(@addresses) do |address|
  json.extract! address, :id, :line1, :line2, :line3, :city, :zipcode, :province, :country
  json.url address_url(address, format: :json)
end
