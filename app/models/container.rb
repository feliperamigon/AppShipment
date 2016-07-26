class Container < ActiveRecord::Base
  belongs_to :user
  has_many :packages , :through => :shipments
end
