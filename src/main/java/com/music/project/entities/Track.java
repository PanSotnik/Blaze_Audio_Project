package com.music.project.entities;


import com.music.project.enumerations.Genre;

import javax.persistence.*;
import java.util.ArrayList;

@Entity
@Table(name="Tracks")
public class Track {

    @Id
    @GeneratedValue
    private int id;

    private String title;
    private String artist;
    private String year;
    private String description;
    private boolean isPrivate;

    private int likes;

    @Enumerated(EnumType.STRING)
    private Genre genre;

    private String filename;
    private String filepath;

    private ArrayList<String> likedUsers = new ArrayList<>();

    private String userString;
    private String privateString;

    public Track() {
    }

    public Track(String title, String artist, String year, String description, Genre genre, String userString, String filepath, String filename, boolean isPrivate, String privateString, int likes, ArrayList<String> likedUsers) {
        this.title = title;
        this.artist = artist;
        this.year = year;
        this.description = description;
        this.genre = genre;
        this.userString = userString;
        this.filepath = filepath;
        this.filename = filename;
        this.isPrivate = isPrivate;
        this.privateString = privateString;
        this.likes = likes;
        this.likedUsers = likedUsers;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getArtist() {
        return artist;
    }

    public void setArtist(String artist) {
        this.artist = artist;
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) { this.year = year; }

    public String getUserString() { return userString; }

    public void setUserString(String userString) { this.userString = userString; }

    public String getFilepath() { return filepath; }

    public void setFilepath(String filepath) {
        this.filepath = filepath;
    }

    public boolean isPrivate() {
        return isPrivate;
    }

    public void setPrivate(boolean aPrivate) { isPrivate = aPrivate; }

    public String getPrivateString() {
        return privateString;
    }

    public void setPrivateString(String privateString) {
        this.privateString = privateString;
    }

    public String getDescription() { return description; }

    public void setDescription(String description) { this.description = description; }

    public Genre getGenre() { return genre; }

    public void setGenre(Genre genre) { this.genre = genre; }

    public int getLikes() { return likes; }

    public void setLikes(int likes) { this.likes = likes; }

    public String getFilename() { return filename; }

    public void setFilename(String filename) { this.filename = filename; }

    public ArrayList<String> getLikedUsers() {
        return likedUsers;
    }
}
