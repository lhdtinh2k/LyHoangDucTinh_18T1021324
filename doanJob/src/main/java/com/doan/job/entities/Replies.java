package com.doan.job.entities;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name = "replies")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Replies {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @ManyToOne
    @JoinColumn(name = "commentid")
    private Comments comment;
    private String binhluan;
    private String postedday;


}
