class BulkDeliveryPdf < Prawn::Document
  def initialize(bulk_delivery_details)
    super(:page_size => 'A5')
    @bulk_delivery_details = bulk_delivery_details
    delivery_name
  end

  def delivery_name
    define_grid(:columns => 5, :rows => 8, :gutter => 10)
    @bulk_delivery_details.each { |delivery| 
        font("#{Rails.root.join('public/fonts/gkai00mp.ttf')}") do
          grid([1, 0], [7, 2]).bounding_box do
            move_down 15
            address = ''
            if delivery.province
              address += delivery.province
            end
            if delivery.city
              address += delivery.city
            end
            if delivery.district
              address += delivery.district
            end

            indent 0, 20 do
              text "#{delivery.name}", size: 11, :align => :right
              text "#{address}", size: 12, :align => :right
              text "#{delivery.street}", size: 12, :align => :right
            end
            
            start_new_page
          end
        end
    }
  end
end