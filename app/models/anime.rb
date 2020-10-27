class Anime < ActiveRecord::Base 
    #activerecord::base will let you have access to rake tasks and other activerecord methods; the core of MVC, whih is the model 
    belongs_to :user 
end 