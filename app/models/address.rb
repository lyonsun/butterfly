class Address
  include Mongoid::Document
  field :line1, type: String
  field :line2, type: String
  field :line3, type: String
  field :city, type: String
  field :zipcode, type: String
  field :province, type: String
  field :country, type: String
end
