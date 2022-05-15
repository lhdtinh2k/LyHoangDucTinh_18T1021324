package com.doan.job.entities;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "district")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Districts {
    @Id
    private String id;
    private String name;
    @ManyToOne
    @JoinColumn(name = "tinhid")
    private Provinces province;
    @JsonIgnore
    @OneToMany(mappedBy = "district", fetch = FetchType.LAZY)
    private List<SubDistricts> subDistrictList;
}
