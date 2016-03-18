json.array!(@shippings) do |shipping|
  json.extract! shipping, :id, :company, :tracking_number, :status
  json.url shipping_url(shipping, format: :json)
end
