require 'net/http'

class Connector

  attr_accessor :payload, :endpoint, :response, :user, :pass, :host, :port, :auth_enabled

  def post
    req = Net::HTTP::Post.new(CoverBoard::Config.endpoint, initheader = {'Content-Type' =>'application/json'})

    if CoverBoard::Config.user && CoverBoard::Config.password
      req.basic_auth CoverBoard::Config.user, CoverBoard::Config.password
    end

    req.body = @payload

    puts "Pushing to #{CoverBoard::Config.host}:#{CoverBoard::Config.port}#{CoverBoard::Config.endpoint}"
    puts "Application id #{CoverBoard::Config.uid}"
    puts "Payload #{@payload}"
    response = Net::HTTP.new(CoverBoard::Config.host, CoverBoard::Config.port).start {|http| http.request(req) }
    @response =  "Response #{response.code} #{response.message}: #{response.body}"
  end

end
