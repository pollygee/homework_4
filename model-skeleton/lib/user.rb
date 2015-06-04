class User < ActiveRecord::Base
  has_many :user_stats
  has_many :stats, through: :user_stats
end