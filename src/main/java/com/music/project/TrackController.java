package com.music.project;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.io.File;
import java.io.IOException;
import java.util.*;

@Controller
public class TrackController {

    private String login;

    @Autowired
    private TrackService trackService;

    private void userData(){
        User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        login = user.getUsername();
    }

    @ResponseBody
    @RequestMapping(value = "/newtrack", method = RequestMethod.POST)
    public ModelAndView handleUpload(@RequestParam(value = "multipartFile") MultipartFile multipartFile,
                                     @RequestParam String title,
                                     @RequestParam(required = false) String artist,
                                     @RequestParam(required = false) String year,
                                     @RequestParam Genre genre,
                                     @RequestParam(required = false) String description,
                                     @RequestParam(required = false) boolean isPrivate,
                                     String filePath,
                                     Model model){

    if (!multipartFile.isEmpty() && multipartFile.getContentType().equalsIgnoreCase("audio/mp3")) {

        String filename = multipartFile.getOriginalFilename();

        if (trackService.existsByFilename(filename)) {
            model.addAttribute("exists", true);
            return new ModelAndView("upload");
        }

        //String base = System.getProperty("user.dir") + "/src/main/webapp/resources/App_uploads/";
        String base = "C:\\App_uploads\\";

        switch (genre){
            case blues: filePath = base + "blues\\" + filename;
                break;
            case classic: filePath = base + "classic\\" + filename;
                break;
            case country: filePath = base + "country\\" + filename;
                break;
            case electronic: filePath = base + "electronic\\" + filename;
                break;
            case hiphop: filePath = base + "hiphop\\" + filename;
                break;
            case jazz: filePath = base + "jazz\\" + filename;
                break;
            case pop: filePath = base + "pop\\" + filename;
                break;
            case rap: filePath = base + "rap\\" + filename;
                break;
            case rock: filePath = base + "rock\\" + filename;
                break;
            case metal: filePath = base + "metal\\" + filename;
                break;
        }

        File dest = new File(filePath);

        try {
            multipartFile.transferTo(dest);
        } catch (IllegalStateException | IOException e) {
            e.printStackTrace();
            userData();
            model.addAttribute("login", login);
            model.addAttribute("error", true);
            return new ModelAndView("upload");
        }

        saveToDB(title, artist, year, genre, description, filePath, filename, isPrivate);


        model.addAttribute("login", login);
        model.addAttribute("success", true);
        return new ModelAndView("upload");
    }
        userData();
        model.addAttribute("login", login);
        model.addAttribute("error", true);

        return new ModelAndView("upload");
}


private void saveToDB(String title, String artist, String year, Genre genre, String description, String filePath, String fileName, boolean isPrivate){

    userData();

    String privateValue = String.valueOf(isPrivate);
    int likes = 0;
    ArrayList<String> likedUsers = new ArrayList<>();

    Track dbTrack = new Track(title, artist, year, description, genre, login, filePath, fileName, isPrivate, privateValue, likes, likedUsers);
    trackService.upload(dbTrack);
}

    @RequestMapping(value = "/play", method = RequestMethod.GET)
    public String play(Model model, String makePrivate, boolean isPrivate){

        userData();

        if (makePrivate == null || makePrivate.equals("no")){
            isPrivate = false;
        } else if (makePrivate.equals("yes")){
            isPrivate = true;
        }

        String[] genres = {"blues", "classic", "country", "electronic", "hiphop", "jazz", "pop", "rap", "rock", "metal"};

        for (String genre : genres){
            model.addAttribute(genre, trackService.findByPrivateGenre(Genre.valueOf(genre), isPrivate));
        }
        model.addAttribute("login", login);

            return "player";

}

    @RequestMapping(value = "/increment", method = RequestMethod.GET)
    public String incrementLikes(@RequestParam String trackName){

    userData();

    Track toLike = trackService.returnTrack(trackName);
    ArrayList<String> usersWhoHaveLiked = toLike.getLikedUsers();

    //Check if the current user has liked this track already and return with no changes if so
        if (!usersWhoHaveLiked.isEmpty()) {

        if (usersWhoHaveLiked.contains(login)){
            return "redirect:/play";
            }
        }

    int likes = toLike.getLikes();
    likes++;
    toLike.setLikes(likes);
    usersWhoHaveLiked.add(login);
    trackService.update(toLike);

    return "redirect:/play";

    }



}
