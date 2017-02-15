package com.music.project;

public interface TrackService {

    void upload(Track track);
    void update(Track track);
    Track[] findByGenre(Genre genre);
    Track[] findByPrivateGenre(Genre genre, boolean isPrivate);
    Track returnTrack(String filename);
    boolean existsByFilename(String filename);
}
