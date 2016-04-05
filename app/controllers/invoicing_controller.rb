class InvoicingController < ApplicationController
  def index
    # @sample_invoicing = File.read(Rails.root.join('db', 'sample', 'sample_invoicing.json'))
    # render :json => @sample_invoicing

    require "prawn"

    Prawn::Document.generate("hello.pdf") do
      text "Hello World!"
    end
  end
end
