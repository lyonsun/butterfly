class Shipping
  include Mongoid::Document
  field :company, type: String
  field :tracking_number, type: String
  field :status, type: String

  belongs_to :order, class_name: "Order", inverse_of: :order
end
