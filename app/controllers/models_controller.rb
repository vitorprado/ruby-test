class ModelsController < ApplicationController
  def index
    brand_id = params[:brand][:id]
    ModelsUpdater.update(brand_id)
    @models = Brand.find(brand_id).models
  end
end
