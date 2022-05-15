package com.doan.job.entities;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "projects")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Projects {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @ManyToOne
    @JoinColumn(name = "userid")
    private Users user;
    @ManyToOne
    @JoinColumn(name = "categoryid")
    private Categories category;
    private String projectname;
    private double amountcalled;
    private String projectdetail;
    private String title;
    private String country;
    private String province;
    private String district;
    private String subdistrict;
    private String houseno;
    private float totalvoted;
    private int sumvoted;
    private int aceptedstatus;
    private String imagepresent;
    private Date postedday;
    @JsonIgnore
    @OneToMany(mappedBy = "project", fetch = FetchType.LAZY)
    private List<Comments> comments;
    @JsonIgnore
    @OneToMany(mappedBy = "project", fetch = FetchType.EAGER)
    private List<InvestedProjects> investedProjects;
    @JsonIgnore
    @OneToMany(mappedBy = "project", fetch = FetchType.LAZY)
    private List<ImageOfProject> imageOfProjects;

    public Projects(Users user, Categories category, String projectname,
                    double amountcalled, String projectdetail, String title,
                    String country, String province, String district, String subdistrict, String houseno, String imagepresent, Date postedday) {
        this.user = user;
        this.category = category;
        this.projectname = projectname;
        this.amountcalled = amountcalled;
        this.projectdetail = projectdetail;
        this.title = title;
        this.country = country;
        this.province = province;
        this.district = district;
        this.subdistrict = subdistrict;
        this.houseno = houseno;
        this.imagepresent = imagepresent;
        this.postedday = postedday;
    }
}
