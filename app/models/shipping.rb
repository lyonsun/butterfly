class Shipping
  include Mongoid::Document
  field :company, type: String
  field :tracking_number, type: String
  field :status, type: String
end
