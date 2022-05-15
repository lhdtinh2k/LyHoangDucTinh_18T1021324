package com.doan.job.entities;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name = "candidate")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Candidate {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @ManyToOne
    @JoinColumn(name = "userid")
    private Users user;
    private String investorsname;
    private String abbreviations;
    private String logo;
    private String content;
    private String country;
    private String province;
    private String district;
    private String subdistrict;
    private String houseno;
    private String sdt;
    private String email;

    public Candidate(Users user, String investorsname, String abbreviations, String logo, String content, String country, String province, String district, String subdistrict, String houseno, String sdt, String email) {
        this.user = user;
        this.investorsname = investorsname;
        this.abbreviations = abbreviations;
        this.logo = logo;
        this.content = content;
        this.country = country;
        this.province = province;
        this.district = district;
        this.subdistrict = subdistrict;
        this.houseno = houseno;
        this.sdt = sdt;
        this.email = email;
    }
}
