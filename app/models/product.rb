class Product
  include Mongoid::Document
  field :name, type: String
  field :description, type: String
  field :price, type: Float
  field :stock, type: Integer

  field :sku, type: String

  has_many :line_item, class_name: "LineItem", inverse_of: :product

  
end
