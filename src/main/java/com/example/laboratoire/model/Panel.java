/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.laboratoire.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import java.util.Date;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

/**
 *
 * @author CHRISTIAN
 */

@Entity
@Table(name="panel")
public class Panel {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
   
    /******** Used to hold  testIds that will be created when posting  a panel **/
    @Transient
    List<Integer> testIds;

    public List<Integer> getTestIds() {
        return testIds;
    }

    public Panel setTestIds(List<Integer> testIds) {
        this.testIds = testIds;
        return this;
    }
   /* *************/
    
    private String name;
    private String description;
    
    @ManyToMany(mappedBy = "panels")
    @JsonIgnore
    private java.util.List<Test> tests;    
    
    @Column(name="created_on")
    @Temporal(TemporalType.TIMESTAMP)
    private java.util.Date createdOn;
    @Column(name="updated_on")
    @Temporal(TemporalType.TIMESTAMP)
    private java.util.Date updatedOn;
    
    @Column(name="statut_vie")
    private boolean statutVie;

    ///// End of properties attributes
    
    public Panel(){}
    
    public Panel(int id){
        this.id = id;
    }

    public Panel(int id, String name, String description, Date createOn, Date updatedOn, boolean statutVie) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.createdOn = createOn;
        this.updatedOn = updatedOn;
        this.statutVie = statutVie;
    }

    
    public int getId() {
        return id;
    }

    public Panel setId(int id) {
        this.id = id;
        return this;
    }

    public String getName() {
        return name;
    }

    public Panel setName(String name) {
        this.name = name;
        return this;
    }

    public String getDescription() {
        return description;
    }

    public Panel setDescription(String description) {
        this.description = description;
        return this;
    }
    
    public List<Test> getTests() {
        return tests;
    }

    public Panel setTests(List<Test> tests) {
        this.tests = tests;
        return this;
    }


    public Date getCreatedOn() {
        return createdOn;
    }

    public Panel setCreatedOn(Date createOn) {
        this.createdOn = createOn;
        return this;
    }

    public Date getUpdatedOn() {
        return updatedOn;
    }

    public Panel setUpdatedOn(Date updatedOn) {
        this.updatedOn = updatedOn;
        return this;
    }

    public boolean isAlive() {
        return statutVie;
    }

    public Panel setStatutVie(boolean statutVie) {
        this.statutVie = statutVie;
        return this;
    }
     
    
}
