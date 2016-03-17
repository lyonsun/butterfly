class Order
  include Mongoid::Document
  field :date_placed, type: Time
  field :date_paid, type: Time
  field :total_price, type: Float
  field :notes, type: String
end
