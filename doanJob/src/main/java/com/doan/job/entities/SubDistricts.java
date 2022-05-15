package com.doan.job.entities;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name = "subdistrict")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class SubDistricts {
    @Id
    private String id;
    private String name;
    @ManyToOne
    @JoinColumn(name = "quanhuyenid")
    private Districts district;
}
