class Customer
  include Mongoid::Document
  field :name, type: String
  field :phone, type: String
  field :email, type: String

  has_many :orders, class_name: "Order", inverse_of: :customer

  has_many :addresses, class_name: "Address", inverse_of: :customer
end
