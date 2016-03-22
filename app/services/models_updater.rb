class ModelsUpdater

  def self.update(id)
    existing_models = Model.where(brand_id: id).pluck(:name).map(&:downcase)
    Model.create self.fetch_and_filter(existing_models, id)
  end

  private 

  def self.fetch_and_filter(saved_models, current_id)
    WebmotorsFetcherService
      .fetch("modelos", { marca: current_id})
      .reject{ |item| saved_models.include?(item["Nome"].downcase) }
      .map{ |item| { id: item["Id"], brand_id: current_id, name: item["Nome"]} }
  end
end