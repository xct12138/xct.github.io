package bean;

public class Article {
    private String aid;
    private String author;
    private String title;
    private String textPath;
    private Integer likeText;
    private Integer collect;

    public String getAid() {
        return aid;
    }

    public void setAid(String aid) {
        this.aid = aid;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getTextPath() {
        return textPath;
    }

    public void setTextPath(String textPath) {
        this.textPath = textPath;
    }

    public Integer getLikeText() {
        return likeText;
    }

    public void setLikeText(Integer likeText) {
        this.likeText = likeText;
    }

    public Integer getCollect() {
        return collect;
    }

    public void setCollect(Integer collect) {
        this.collect = collect;
    }
}
