/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.laboratoire.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;

/**
 *
 * @author CHRISTIAN
 */

@Entity
@Table(name="sample")
public class Sample {
    
   // Employee holder id for creating a patient during Sample posting
    @javax.persistence.Transient
   private int employeeId;

    public int getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(int employeeId) {
        this.employeeId = employeeId;
    }
    
    
    //////////////////////////////////////////////////
    @javax.persistence.Transient
    private List<Long> testIds;

    public List<Long> getTestIds() {
        return testIds;
    }

    public void setTestIds(List<Long> testIds) {
        this.testIds = testIds;
    }
    
    ////////////////////////////////////////
    @Transient
    private int sampleTypeId;

    public int getSampleTypeId() {
        return sampleTypeId;
    }

    public void setSampleTypeId(int sampleTypeId) {
        this.sampleTypeId = sampleTypeId;
    }
    ////////////////////////////////////////////////
    
    
    /************************************************************************
     *  
     */
    
    
      
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @ManyToOne
    @NotNull
    private Patient patient;
    
    @ManyToOne
    private Employee labTechnician;
    
    @ManyToOne
    @NotNull
    private SampleType sampleType;
    
    private String requester;
  //  private String requesterAddress; // Or Institution
    private String note;
    
    @OneToMany(mappedBy = "sample", cascade = CascadeType.ALL)
    private List<Result> results;
    
    
    @OneToMany(mappedBy = "sample", cascade = CascadeType.ALL, orphanRemoval = true)
    @JsonIgnoreProperties("sample")
    private java.util.List<TestEffectue> testsEffectues = new ArrayList();
    
    @Column(name="created_on")
    @Temporal(TemporalType.TIMESTAMP)
    private java.util.Date createdOn;
    @Column(name="updated_on")
    @Temporal(TemporalType.TIMESTAMP)
    private java.util.Date updatedOn;
    @Column(name="statut_vie")
    private boolean statutVie;

    public Sample() {
    }

    public Sample(Long id){
        this.id = id;
        this.patient = null;
        this.labTechnician = null;
        this.sampleType = null;
        this.testsEffectues = null;
    }
    public Sample(Long id, Patient patient, Employee labTechnician, SampleType sampleType, Date createdOn, Date updatedOn, boolean statutVie) {
        this.id = id;
        this.patient = patient;
        this.labTechnician = labTechnician;
        this.sampleType = sampleType;
        this.createdOn = createdOn;
        this.updatedOn = updatedOn;
        this.statutVie = statutVie;
    }
    
    public Long getId() {
        return id;
    }

    public Sample setId(Long id) {
        this.id = id;
        return this;
    }

    public Patient getPatient() {
        return this.patient;
    }

    public Sample setPatient(Patient patient) {
        this.patient = patient;
        return this;
    }

    public SampleType getSampleType() {
        return sampleType;
    }

    public Sample setSampleType(SampleType sampleType) {
        this.sampleType = sampleType;
        return this;
    }

    public List<TestEffectue> getTestsEffectues() {
        return testsEffectues;
    }

    public Sample setTestsEffectues(List<TestEffectue> tests) {
        this.testsEffectues = tests;
        return this;
    }

    public Date getCreatedOn() {
        return createdOn;
    }

    public Sample setCreatedOn(Date createdOn) {
        this.createdOn = createdOn;
        return this;
    }

    public Date getUpdatedOn() {
        return updatedOn;
    }

    public Sample setUpdatedOn(Date updatedOn) {
        this.updatedOn = updatedOn;
        return this;
    }

    public Employee getLabTechnician() {
        return labTechnician;
    }

    public Sample setLabTechnician(Employee labTechnician) {
        this.labTechnician = labTechnician;
        return this;
    }

    public boolean isAlive() {
        return statutVie;
    }

    public Sample setStatutVie(boolean statutVie) {
        this.statutVie = statutVie;
        return this;
    }

    public String getRequester() {
        return requester;
    }

    public Sample setRequester(String requester) {
        this.requester = requester;
        return this;
    }

//    public String getRequesterAddress() {
//        return requesterAddress;
//    }
//
//    public void setRequesterAddress(String requesterAddress) {
//        this.requesterAddress = requesterAddress;
//    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public List<Result> getResults() {
        return results;
    }

    public void setResults(List<Result> results) {
        this.results = results;
    }

    
    
    
    
  //*******************************************************************//
    // Attaching and Detaching tests from samples
    
     public void addTest(Test test) {
        TestEffectue testAeffectuer = new TestEffectue(this, test);
        testsEffectues.add(testAeffectuer);
        test.getTestsEffectues().add(testAeffectuer);
    }
    
    public void removeTest(Test test) {
        for (Iterator<TestEffectue> iterator = testsEffectues.iterator();
             iterator.hasNext(); ) {
            TestEffectue te = iterator.next();
 
            if (te.getSample().equals(this) &&
                    te.getTest().equals(test)) {
                iterator.remove();
                te.getTest().getTestsEffectues().remove(te);
                te.setSample(null);
                te.setTest(null);
            }
        }
    }
    
    //********************************************************//
    
    
    
   
    
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
 
        if (o == null || getClass() != o.getClass())
            return false;
        Sample s = (Sample) o;
        return java.util.Objects.equals(createdOn, s.createdOn);
    }
 
    @Override
    public int hashCode() {
        return java.util.Objects.hash(createdOn);
    
    }
    
}
