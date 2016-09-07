class User < ActiveRecord::Base
  has_secure_password
  has_many :members
  has_many :groups, :through => :members
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, :uniqueness => {case_sensitive: false, message: "has already been taken"}
  validates :password, presence: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
end
