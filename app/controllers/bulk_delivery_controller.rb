class BulkDeliveryController < ApplicationController
  before_action :set_bulk_delivery, only: [:show, :edit, :update, :destroy]

  def index
    @bulk_deliveries = BulkDelivery.all
  end

  def show
    @bulk_delivery_details = Delivery.where(bulk_delivery_id: params[:id])

    respond_to do |format|
      format.html
      format.pdf do

        Prawn::Labels.types = {
          "CustomSheet" => {
            "paper_size" => "A5",
            "columns"    => 2,
            "rows"       => 5
        }}

        labels = Prawn::Labels.render(@bulk_delivery_details, :type => "CustomSheet") do |pdf, delivery|
          pdf.font("#{Rails.root.join('public/fonts/Corn_Song_Simplified_Chinese.ttf')}") do
            pdf.text delivery.name, :size => 14
            pdf.text delivery.province+','+delivery.city+','+delivery.district+','+delivery.street
          end
        end

        send_data labels, :filename => "bulk_delivery_#{@bulk_delivery.id}.pdf",
                          :type => "application/pdf", 
                          :disposition => "inline"

        # pdf = BulkDeliveryPdf.new(@bulk_delivery_details)
        # send_data pdf.render, filename: "bulk_delivery_#{@bulk_delivery.id}.pdf",
        #                       type: "application/pdf",
        #                       disposition: "inline"
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