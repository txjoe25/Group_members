class Group < ActiveRecord::Base
  belongs_to :user
  has_many :members, :dependent => :destroy
  has_many :users, :through => :members
  validates :name, presence: true
  validates :description, presence: true
end
