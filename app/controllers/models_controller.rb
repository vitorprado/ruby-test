class ModelsController < ApplicationController
  def index
    #search the models
    uri = URI("http://www.webmotors.com.br/carro/modelos")

    # Make request for Webmotors site
    id = params[:make][:make_id]
    make = Make.where(webmotors_id: id).first

    response = Net::HTTP.post_form(uri, { marca: make.id })
    models_json = JSON.parse response.body

    models_json.each do |json|
      if Model.where(name: json["Nome"], make_id: make.id).size == 0
        Model.create(make_id: make.id, name: json["Nome"])
      end
    end
    @models = Model.where(make_id: make.id)
  end
end
