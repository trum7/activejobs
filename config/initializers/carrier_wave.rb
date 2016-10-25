require 'carrierwave/orm/activerecord'

if Rails.env.production?
   CarrierWave.configure do |config|
    config.fog_credentials = {
      :provider             => 'Rackspace',
      :rackspace_username   => ENV["RACKSPACE_USERNAME"],
      :rackspace_api_key    => ENV["RACKSPACE_APIKEY"],
      :rackspace_region    => :dfw
    }
    config.fog_directory = 'wayuumochilas'
end
end
