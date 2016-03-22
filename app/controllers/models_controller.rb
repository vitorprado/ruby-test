class ModelsController < ApplicationController
  def index
    brand_id = params[:brand][:id]
    ModelsUpdater.update(brand_id)
    @models = Model.where(brand_id: brand_id)
  end
end
