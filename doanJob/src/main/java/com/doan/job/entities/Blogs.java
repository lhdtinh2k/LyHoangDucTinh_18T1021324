package com.doan.job.entities;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import java.util.Date;
import javax.persistence.*;

@Entity
@Table(name = "blogs")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Blogs {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String title;
    private String content;
    private Date posteddate;
    private String image;

    public Blogs(String title, String content, Date posteddate, String image) {
        this.title = title;
        this.content = content;
        this.posteddate = posteddate;
        this.image = image;
    }
}
