package com.doan.job.entities;


import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name = "investedproject")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class InvestedProjects {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @ManyToOne
    @JoinColumn(name = "userid")
    private Users user;
    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "projectid")
    private Projects project;
    private int acceptstatus;

    public InvestedProjects(Users user, Projects project) {
        this.user = user;
        this.project = project;
    }
}
