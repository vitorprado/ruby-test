class BrandsController < ApplicationController  
  
  def index
    BrandsUpdater.update()
    @brands = Brand.all
  end
end