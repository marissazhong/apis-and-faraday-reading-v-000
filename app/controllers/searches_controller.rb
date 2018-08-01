class SearchesController < ApplicationController
  def search
  end

  def foursquare
    @resp = Faraday.get 'https://api.foursquare.com/v2/venues/search' do |req|
      req.params['client_id'] = "OVOJHATU3CX4PRILEBLVNX31HJSIEH4DRUUAJ4MQKKMTHND0"
      req.params['client_secret'] = "EWEOPVEYLID11PMN1G0S0JELG3AZIXBQXCQ2WRZ1LWJQ43ES"
      req.params['v'] = '20160201'
      req.params['near'] = params[:zipcode]
      req.params['query'] = 'coffee shop'
    end
    body_hash = JSON.parse(@resp.body)
    @venues = body_hash["response"]["venues"]
    render 'search'
  end
end
