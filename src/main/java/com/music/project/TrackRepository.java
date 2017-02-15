package com.music.project;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface TrackRepository extends JpaRepository<Track, Long> {

    @Query("SELECT u FROM Track u where u.genre = :genre")
    Track[] findByGenre(@Param("genre") Genre genre);

    @Query("SELECT u FROM Track u where u.genre = :genre and u.isPrivate = :isPrivate")
    Track[] findByPrivateGenre(@Param("genre") Genre genre, @Param("isPrivate") boolean isPrivate);

    @Query("SELECT u FROM Track u where u.filename = :filename")
    Track returnTrack(@Param("filename") String filename);

    @Query("SELECT CASE WHEN COUNT(u) > 0 THEN true ELSE false END FROM Track u WHERE u.filename = :filename")
    boolean existByFilename(@Param("filename") String filename);
}
