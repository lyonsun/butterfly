class DeliveryController < ApplicationController
  def index
    @deliveries = Delivery.all
  end
end