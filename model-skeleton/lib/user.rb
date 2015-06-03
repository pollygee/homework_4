class User < ActiveRecord::Base
  has_many :stats, foreign_key: "user_id"
end