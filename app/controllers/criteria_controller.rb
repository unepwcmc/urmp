class CriteriaController < ApplicationController
  def show
    @criterion = Criterion.find(params[:id])
    @resource_links = @criterion.resource_links
  end

end
