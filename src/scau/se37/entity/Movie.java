package scau.se37.entity;

import org.springframework.web.multipart.MultipartFile;

public class Movie {

	private int movieId;
	private String movieName;
	private String movieMainActor;
	private String movieDirector;
	private String movieDuration;
	private String movieStatus;
	private MultipartFile movieFile;
	
	public int getMovieId() {
		return movieId;
	}
	public void setMovieId(int movieId) {
		this.movieId = movieId;
	}
	public String getMovieName() {
		return movieName;
	}
	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}
	public String getMovieMainActor() {
		return movieMainActor;
	}
	public void setMovieMainActor(String movieMainActor) {
		this.movieMainActor = movieMainActor;
	}
	public String getMovieDirector() {
		return movieDirector;
	}
	public void setMovieDirector(String movieDirector) {
		this.movieDirector = movieDirector;
	}
	public String getMovieDuration() {
		return movieDuration;
	}
	public void setMovieDuration(String movieDuration) {
		this.movieDuration = movieDuration;
	}
	public String getMovieStatus() {
		return movieStatus;
	}
	public void setMovieStatus(String movieStatus) {
		this.movieStatus = movieStatus;
	}
	public void setMovieFile(MultipartFile movieFile) {
        this.movieFile = movieFile;
    }

    public MultipartFile getMovieFile() {
        return movieFile;
    }
	
}
