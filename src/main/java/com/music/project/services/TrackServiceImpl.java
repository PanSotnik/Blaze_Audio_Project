package com.music.project.services;

import com.music.project.repositories.TrackRepository;
import com.music.project.entities.Track;
import com.music.project.enumerations.Genre;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class TrackServiceImpl implements TrackService {

    @Autowired
    private TrackRepository trackRepository;

    @Override
    public void upload(Track track) { trackRepository.save(track); }

    @Override
    public void update(Track track) { trackRepository.save(track); }

    @Override
    @Transactional(readOnly = true)
    public Track[] findByPrivateGenre(Genre genre, boolean isPrivate) {
        if (!isPrivate){
            return trackRepository.findByGenreAll(genre);
        } else {
            return trackRepository.findByPrivateGenre(genre);
        }
    }

    @Override
    @Transactional(readOnly = true)
    public Track returnTrack(String filename) { return trackRepository.returnTrack(filename); }

    @Override
    @Transactional(readOnly = true)
    public boolean existsByFilename(String filename) { return trackRepository.existByFilename(filename); }
}
