class PrinciplesController < ApplicationController
  def index
    @principles = Principle.all
  end

end
