class CreateSpotTracks < ActiveRecord::Migration[5.2]
  def change
    create_table :spot_tracks do |t|
      t.column(:playlist_href, :string)
      t.column(:playlist_id, :string)
      t.column(:playlist_name, :string)
      t.column(:track_saved, :date)
      t.column(:album, :string)
      t.column(:artist, :string)
      t.column(:disc_number, :integer)
      t.column(:duration_ms, :string)
      t.column(:playlist_href, :string)
      t.column(:track_href, :string)
      t.column(:spotify_track_id, :string)
      t.column(:preview_url, :string)
      t.column(:track_number, :integer)
      t.column(:spotify_uri, :string)
      t.column(:is_local, :string)
      t.column(:star_rating, :integer)
      t.column(:is_local, :string)
      t.column(:comment, :text)
      t.column(:album_date, :date)
      t.column(:sort_attribute1, :string)
      t.column(:sort_attribute2, :string)
      t.column(:sort_attribute3, :string)
      t.column(:sort_attribute4, :string)           
      t.timestamps
    end
  end
end
