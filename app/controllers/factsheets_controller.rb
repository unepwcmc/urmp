class FactsheetsController < ApplicationController
  def show
    @factsheet = Factsheet.find(params[:id])
    send_file @factsheet.attachment.path
  end
end
