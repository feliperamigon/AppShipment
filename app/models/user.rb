class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  mount_uploader :avatar, AvatarUploader
  has_many :containers
  has_many :packages
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # User Avatar Validation
  validates_integrity_of  :avatar
  validates_processing_of :avatar
 
  private
    def avatar_size_validation
      errors[:avatar] << "should be less than 3MB" if avatar.size > 3.megabytes
    end
end
