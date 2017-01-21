require_relative 'lib/helper'

class AuditHalo
  class << self
    def halo_ips
      halo_servers = ServersController.new.index('state=active')
      halo_servers['servers'].map { |e| [e['connecting_ip_address'], e['primary_ip_address']] }.flatten
    end

    def ec2_servers
      options = [{ name: 'instance-state-name', values: ['running'] }]
      EC2.client.describe_instances(filters: options)
    end

    def ip_exists?(srv, ips)
      ips.include? srv.public_ip_address or ips.include? srv.private_ip_address
    end

    def ec2_without_halo
      msg = 'Halo is not installed on'
      ips = halo_ips

      ec2_servers['reservations'].each do |reservation|
        reservation['instances'].each do |instance|
          puts "#{msg} #{instance.instance_id}" unless ip_exists?(instance, ips)
        end
      end
    end
  end
end

AuditHalo.ec2_without_halo