class CreateAnimes < ActiveRecord::Migration
    def change
      create_table :animes do |t|
        t.string :name 
        t.integer :user_id 
    end
  end
end 
