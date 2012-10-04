class ResourcesSearchController < ApplicationController
  def show
    @search = ResourceSearch.new
  end

  def results
    @search = ResourceSearch.new(params[:search])
    @search.find

    render :show
  end
end
