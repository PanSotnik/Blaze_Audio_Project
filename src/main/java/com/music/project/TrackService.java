package com.music.project;

public interface TrackService {

    void upload(Track track);
    void update(Track track);
    Track[] findByPrivateGenre(Genre genre, boolean isPrivate);
    Track returnTrack(String filename);
    boolean existsByFilename(String filename);
}
