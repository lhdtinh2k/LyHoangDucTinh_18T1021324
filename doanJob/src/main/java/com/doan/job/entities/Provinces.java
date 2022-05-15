package com.doan.job.entities;


import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "province")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Provinces {
    @Id
    private String id;
    private String name;
    @JsonIgnore
    @OneToMany(mappedBy = "province", fetch = FetchType.LAZY)
    private List<Districts> districts;
}
