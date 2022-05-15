package com.doan.job.entities;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name = "imageofproject")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ImageOfProject {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @ManyToOne
    @JoinColumn(name = "projectid")
    private Projects project;
    private String imagename;

    public ImageOfProject(Projects project, String imagename) {
        this.project = project;
        this.imagename = imagename;
    }
}
