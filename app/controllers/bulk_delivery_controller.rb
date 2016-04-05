class BulkDeliveryController < ApplicationController
  before_action :set_bulk_delivery, only: [:show, :edit, :update, :destroy]

  def index
    @bulk_deliveries = BulkDelivery.all
  end

  def show
    @bulk_delivery_details = Delivery.where(bulk_delivery_id: params[:id])
  end

  def import
    file = params[:file]
    BulkDelivery.import(file)
    redirect_to root_url, notice: "Order addresses imported."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bulk_delivery
      @bulk_delivery = BulkDelivery.find(params[:id])
    end
end