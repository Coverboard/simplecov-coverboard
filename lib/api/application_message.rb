require 'json'

class ApplicationMessage
  attr_accessor :metrics, :uid, :ts

  def to_json
    msg = Hash.new
    msg[:uid] = @uid
    msg[:metrics] = @metrics
    msg[:ts] = Time.now.strftime('%s')
    msg.to_json
  end
end
