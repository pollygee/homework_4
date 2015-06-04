class Stat < ActiveRecord::Base
  has_many :user_stats
  has_many :users, through: :user_stats
end