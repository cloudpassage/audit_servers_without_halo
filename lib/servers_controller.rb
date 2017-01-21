# encoding: utf-8
require 'json'
require_relative 'validator'
require_relative 'api_controller'

# Returns server information
class ServersController < ApiController
  def initialize
    super
  end

  def index(filters = nil)
    @api.get_paginated("v1/servers?#{filters}")
  end

  def show(agent_id)
    resp = @api.get("v1/servers/#{agent_id}")
    Validate.response(resp, 200)

    data = JSON.parse(resp)
    Validate.has_content(data)

    data
  end
end
