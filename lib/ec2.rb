require 'aws-sdk'
require_relative 'configs'

class EC2
  class << self
    def client
      @client ||= make_client
    end

    def make_client
      Aws::EC2::Client.new(
        access_key_id: Config['aws_key_id'],
        secret_access_key: Config['aws_secret_key'],
        region: Config['aws_region']
      )
    end
  end
end
