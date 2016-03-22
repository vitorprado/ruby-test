require 'net/http'

class BrandsController < ApplicationController
  def index
    #search the make
    uri = URI("http://www.webmotors.com.br/carro/marcas")

    # Make request for Webmotors site
    response = Net::HTTP.post_form(uri, {})
    json = JSON.parse response.body

    # Itera no resultado e grava as marcas que ainda não estão persistidas
    json.each do |make_params|
      if Brand.where(name: make_params["Nome"]).size == 0
        Brand.create(name: make_params["Nome"], webmotors_id: make_params["Id"])
      end
    end
    @brands = Brand.all
  end
end
