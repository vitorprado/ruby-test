class WebmotorsFetcherService

  ENDPOINT = "http://www.webmotors.com.br/carro/"

  def self.fetch(resource, params = {})
    response = Net::HTTP.post_form URI(ENDPOINT + resource), params
    JSON.parse response.body
  end
end
