class User < ActiveRecord::Base

  has_many :accounts, dependent: :destroy
  validates :email, presence: true, uniqueness: true

  has_secure_password

end
