class FactsheetsController < ApplicationController
  def index
    @factsheets = Factsheet.order('name ASC')
  end

  def show
    @factsheet = Factsheet.find(params[:id])
    send_file @factsheet.attachment.path
  end
end
