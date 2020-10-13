class User < ActiveRecord::Base 
    has_many :animes 
    has_secure_password
  
    def slug 
      self.username.strip.downcase.gsub(" ", "-")
    end 
  
    def self.find_by_slug(slug) 
      User.all.find {|user| user.slug == slug}
    end 
end 