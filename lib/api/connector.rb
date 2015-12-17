require 'net/http'

class Connector
  def post(payload)
    uri = build_uri
    req = Net::HTTP::Post.new(uri)
    req.content_type = 'application/json'
    req.body = payload

    if CoverBoard::Config.user && CoverBoard::Config.password
      req.basic_auth CoverBoard::Config.user, CoverBoard::Config.password
    end

    if CoverBoard::Config.verbose
      puts "Pushing to #{uri}"
      puts "Application id #{CoverBoard::Config.uid}"
      puts "Payload #{payload}"
    end

    response = Net::HTTP.new(uri.hostname, uri.port).start {|http| http.request(req) }

    if CoverBoard::Config.verbose
      puts "Response #{response.code} #{response.message}: #{response.body}"
    end

    response
  end

  private
    def build_uri
      uri = 'http'
      uri += 's' if CoverBoard::Config.https

      URI("#{uri}://#{CoverBoard::Config.host}:#{CoverBoard::Config.port}#{CoverBoard::Config.endpoint}")
    end
end
