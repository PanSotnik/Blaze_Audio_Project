package com.music.project;

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
    public Track[] findByGenre(Genre genre) { return trackRepository.findByGenre(genre); }

    @Override
    @Transactional(readOnly = true)
    public Track[] findByPrivateGenre(Genre genre, boolean isPrivate) { return trackRepository.findByPrivateGenre(genre, isPrivate); }

    @Override
    @Transactional(readOnly = true)
    public Track returnTrack(String filename) { return trackRepository.returnTrack(filename); }

    @Override
    @Transactional(readOnly = true)
    public boolean existsByFilename(String filename) { return trackRepository.existByFilename(filename); }
}
