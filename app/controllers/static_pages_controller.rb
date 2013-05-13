class StaticPagesController < ApplicationController
  def faq
    @factsheets = Factsheet.order('name ASC')
  end
end
