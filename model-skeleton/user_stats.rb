class UserStat < ActiveRecord::Base
  belongs_to :user
  belongs_to :stat
  validates_presence_of :name 
end