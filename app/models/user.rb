class User < ActiveRecord::Base 
    has_many :animes 
    has_secure_password
    validates_uniqueness_of :username, :email 
    validates :password, presence:true
end 