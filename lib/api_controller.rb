# encoding: utf-8
require 'cloudpassage'
require_relative 'configs'

# Returns API Instance
class ApiController
  key_id ||= ENV['KEY_ID'] || Config['key_id']
  secret_key ||= ENV['SECRET_KEY'] || Config['secret_key']

  API = Api.new(key_id, secret_key, Config['api_hostname'])

  def initialize
    @api = API
  end
end
