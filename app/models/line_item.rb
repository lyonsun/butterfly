class LineItem
  include Mongoid::Document
  field :quantity, type: Integer

  belongs_to :product, class_name: "Product", inverse_of: :line_items
  
  belongs_to :order, class_name: "Order", inverse_of: :line_items
end
