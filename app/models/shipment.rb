class Shipment < ActiveRecord::Base
  belongs_to :package
  belongs_to :container
end
