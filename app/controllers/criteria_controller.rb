class CriteriaController < ApplicationController
  def show
    @criterion = Criterion.find_by_number(params[:id])
    @resource_links = @criterion.resource_links
  end

end
