json.array!(@orders) do |order|
  json.extract! order, :id, :date_placed, :date_paid, :total_price, :notes
  json.url order_url(order, format: :json)
end
