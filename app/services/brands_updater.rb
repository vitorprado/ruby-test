class BrandsUpdater
  
  def self.update()
    existing_brands = Brand.all.pluck(:name).map(&:downcase)
    Brand.create self.fetch_and_filter(existing_brands)
  end

  private 

  def self.fetch_and_filter(saved_brands)
    WebmotorsFetcherService
      .fetch("marcas")
      .reject{ |item| saved_brands.include?(item["Nome"].downcase) }
      .map{ |item| { id: item["Id"], name: item["Nome"]} }
  end
end