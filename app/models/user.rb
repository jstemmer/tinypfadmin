class User < ActiveRecord::Base
  has_many :aliases
end
