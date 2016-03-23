require 'net/http'

class WebmotorsFetcherService

  def self.fetch(resource, params = {})
    response = Net::HTTP.post_form URI(ENV['ENDPOINT'] + resource), params
    JSON.parse response.body
  end
end
