class BulkDelivery
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String

  has_many :delivery

  def new_item(delivery)
    self.deliveries.build(delivery_id: delivery.id)
  end

  def deliveries
    self.deliveries.map { |i| i.delivery }
  end

  def self.import(name, file)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    bulk_delivery = BulkDelivery.new
    bulk_delivery.name = name
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      delivery = Delivery.create! row.to_hash
      delivery.bulk_delivery_id = bulk_delivery.id
      delivery.save!
      # bulk_delivery.new_item(delivery)
    end
    bulk_delivery.save!
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when ".csv" then Roo::CSV.new(file.path, csv_options: {encoding: "iso-8859-1:utf-8"})
    when ".xls" then Roo::Excel.new(file.path)
    when ".xlsx" then Roo::Excelx.new(file.path)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end
end
