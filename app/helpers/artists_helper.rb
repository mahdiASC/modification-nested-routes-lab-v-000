module ArtistsHelper
  def display_artist(song)
    song.artist.nil? ? link_to("Add Artist", edit_song_path(song)) : link_to(song.artist_name, artist_path(song.artist))
  end

  def artist_select(song, blank)
    # Not sure what other argument is for or why its needed
    if song.artist.nil?
      select_tag "song[artist_id]", options_from_collection_for_select(Artist.all, :id, :name)
    else
      # Multi-line helpers in rails
      # https://thepugautomatic.com/2013/06/helpers/
      capture do
        concat link_to(song.artist_name, artist_path(song.artist))
        concat hidden_field_tag "song[artist_id]", song.artist_id
      end
    end
  end
end
