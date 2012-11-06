class FactsheetsController < ApplicationController
  def index
    @factsheets = Factsheet.grouped_by_resource_topic
  end

  def show
    @factsheet = Factsheet.find(params[:id])
    send_file @factsheet.attachment.path
  end
end
