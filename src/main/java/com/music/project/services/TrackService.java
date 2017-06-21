package com.music.project.services;

import com.music.project.entities.Track;
import com.music.project.enumerations.Genre;

public interface TrackService {

    void upload(Track track);
    void update(Track track);
    Track[] findByPrivateGenre(Genre genre, boolean isPrivate);
    Track returnTrack(String filename);
    boolean existsByFilename(String filename);
}
