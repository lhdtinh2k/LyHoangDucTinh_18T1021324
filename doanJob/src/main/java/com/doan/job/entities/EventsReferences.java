package com.doan.job.entities;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name = "eventsreference")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class EventsReferences {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @ManyToOne
    @JoinColumn(name = "userid")
    private Users user;
    @ManyToOne
    @JoinColumn(name = "categoryid")
    private Categories category;
    private String title;
    private String slug;
    private String content;
    private String posteddate;
    private String startday;
    private String starttime;
    private String endtime;
    private String country;
    private String province;
    private String district;
    private String subdistrict;
    private String houseno;
    private String dayendenroll;
    private int acceptstatus;
}
