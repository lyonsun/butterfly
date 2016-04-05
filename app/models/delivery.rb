class Delivery
  include Mongoid::Document
  field :name, type: String
  field :phone, type: String
  field :province, type: String
  field :city, type: String
  field :district, type: String
  field :street, type: String
  field :postcode, type: String

  belongs_to :bulk_delivery
end
