class User < ActiveRecord::Base 
    validates_uniqueness_of :username
    has_many :animes 
    has_secure_password
end 