require_relative 'lib/helper'

class AuditHalo
  class << self
    def halo_ips(servers)
      servers['servers'].map { |e| e['connecting_ip_address'] }
    end

    def halo_instance_ids(servers)
      instance_ids = []
      servers['servers'].each do |e|
        instance_ids << e['aws_ec2']['ec2_instance_id'] if e.key? 'aws_ec2'
        instance_ids << e['server_label'].match(/(?<=_)(.*)/).to_s unless e['server_label'].nil?
      end

      instance_ids.reject(&:blank?)
    end

    def ec2_servers
      options = [{ name: 'instance-state-name', values: ['running'] }]
      EC2.client.describe_instances(filters: options)
    end

    def ip_exists?(srv, halo_ips)
      halo_ips.include? srv.public_ip_address
    end

    def instance_id_exists?(srv, instance_ids)
      instance_ids.include? srv.instance_id
    end

    def ec2_without_halo
      msg = 'Halo is not installed on'
      halo_servers = ServersController.new.index('state=active')

      ips = halo_ips(halo_servers)
      instance_ids = halo_instance_ids(halo_servers)
      ec2_servers['reservations'].each do |reservation|
        reservation['instances'].each do |instance|
          puts "#{msg} #{instance.instance_id}" unless ip_exists?(instance, ips) or instance_id_exists?(instance, instance_ids)
        end
      end
    end
  end
end

AuditHalo.ec2_without_halo