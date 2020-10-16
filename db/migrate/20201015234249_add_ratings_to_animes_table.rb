class AddRatingsToAnimesTable < ActiveRecord::Migration
  def change
    add_column :animes, :rating, :integer
  end
end
