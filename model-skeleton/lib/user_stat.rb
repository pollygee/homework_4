class UserStat < ActiveRecord::Base
  belongs_to :user
  belongs_to :stat
end