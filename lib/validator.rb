# encoding: utf-8
require 'active_support/core_ext/object/blank'

# Validate
module Validate
  def self.response(resp, resp_code)
    raise "#{resp.code} is returned. #{resp}" unless resp.code.eql? resp_code
  end

  def self.has_content(data)
    raise "#{data} is empty" if data.keys.each { |e| data[e].blank? }.any? { |r| r.eql? true }
  end
end
