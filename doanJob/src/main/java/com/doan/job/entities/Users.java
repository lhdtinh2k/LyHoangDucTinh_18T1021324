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
@Table(name = "users")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Users {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String username;
    private String passwords;
    private String fullname;
    private String gender;
    private String email;
    private String phone;
    private String cccd;
    private Date birthday;
    private String country;
    private String province;
    private String district;
    private String subdistrict;
    private String houseno;
    private String roles;
    private String job;
    private String avataruser;
    @JsonIgnore
    @OneToMany(mappedBy = "user", fetch = FetchType.LAZY)
    private List<Projects> projects;

    @JsonIgnore
    @OneToMany(mappedBy = "user", fetch = FetchType.LAZY)
    private List<Comments> comments;
    @JsonIgnore
    @OneToMany(mappedBy = "user", fetch = FetchType.LAZY)
    private List<EventsReferences> eventsReferences;
    @JsonIgnore
    @OneToMany(mappedBy = "user", fetch = FetchType.LAZY)
    private List<News> news;
    @JsonIgnore
    @OneToMany(mappedBy = "user", fetch = FetchType.LAZY)
    private List<UserCurriculumVitae> userCurriculumVitaes;

    public Users(String username, String passwords, String fullname, String gender, String email,
                 String phone, String cccd, Date birthday, String country, String province,
                 String district, String subdistrict, String houseno, String roles, String avataruser) {
        this.username = username;
        this.passwords = passwords;
        this.fullname = fullname;
        this.gender = gender;
        this.email = email;
        this.phone = phone;
        this.cccd = cccd;
        this.birthday = birthday;
        this.country = country;
        this.province = province;
        this.district = district;
        this.subdistrict = subdistrict;
        this.houseno = houseno;
        this.roles = roles;
        this.avataruser = avataruser;
    }
}
