class Order
  include Mongoid::Document
  field :date_placed, type: Time
  field :date_paid, type: Time
  field :total_price, type: Float
  field :notes, type: String

  has_many :line_items, class_name: "LineItem", inverse_of: :order

  belongs_to :customer, class_name: "Customer", inverse_of: :orders

  has_one :shipping, class_name: "Shipping", inverse_of: :order
end
