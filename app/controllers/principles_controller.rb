class PrinciplesController < ApplicationController
  def index
    @principles = Principle.order(:number)
  end

end
