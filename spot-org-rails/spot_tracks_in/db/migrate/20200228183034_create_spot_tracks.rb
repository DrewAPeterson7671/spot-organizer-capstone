class CreateSpotTracks < ActiveRecord::Migration[5.2]
  def change
    create_table :spot_tracks do |t|
      
      t.timestamps
    end
  end
end
