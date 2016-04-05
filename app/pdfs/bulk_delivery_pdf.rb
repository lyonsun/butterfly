class BulkDeliveryPdf < Prawn::Document
  def initialize(bulk_delivery_details)
    super(top_margin: 50)
    @bulk_delivery_details = bulk_delivery_details
    delivery_name
  end

  def delivery_name
    @bulk_delivery_details.each { |delivery| 
        font("#{Rails.root.join('public/fonts/gkai00mp.ttf')}") do
          text "#{delivery.name}", size: 15, color: "#0035800"
        end
    }
  end
end