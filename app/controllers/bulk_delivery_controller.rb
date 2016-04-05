class BulkDeliveryController < ApplicationController
  before_action :set_bulk_delivery, only: [:show, :edit, :update, :destroy]

  def index
    @bulk_deliveries = BulkDelivery.all
  end

  def show
    @bulk_delivery_details = Delivery.where(bulk_delivery_id: params[:id])

    # labels = Prawn::Labels.render(@bulk_delivery_details, :type => "Avery5160") do |pdf, delivery|
    #   pdf.font("#{Rails.root.join('public/fonts/gkai00mp.ttf')}") do
    #     pdf.text delivery.name
    #   end
    # end

    # send_data labels, :filename => "names.pdf", :type => "application/pdf", :disposition => "inline"

    respond_to do |format|
      format.html
      format.pdf do
        pdf = BulkDeliveryPdf.new(@bulk_delivery_details)
        send_data pdf.render, filename: "bulk_delivery_#{@bulk_delivery.id}.pdf",
                              type: "application/pdf",
                              disposition: "inline"
      end
    end
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