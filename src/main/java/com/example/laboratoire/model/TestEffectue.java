/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.laboratoire.model;

import java.util.Date;
import java.util.Objects;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author CHRISTIAN
 */

@javax.persistence.Entity
@Table(name="test_effectue")
public class TestEffectue {
    
    @EmbeddedId//@JsonIgnore
    private TestEffectueId id;
    
    @ManyToOne
    @MapsId("sampleId")
    private Sample sample;
    
    @ManyToOne
    @MapsId("testId")
    private com.example.laboratoire.model.Test test;
    
//    @OneToOne(mappedBy = "testEffectue")
//    private Result result;     This was transfered to Sample table since creating rows using one form was difficult
    
    @Column(name="created_on")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createdOn;
    
    @Column(name="updated_on")
    @Temporal(TemporalType.TIMESTAMP)
    private Date updatedOn;
    
    @Column(name="statut_vie")
    private boolean statutVie;
    
    @ManyToOne
    private Device deviceUsed;

    public TestEffectue() {
    }

    public TestEffectue(Sample sample, Test test){
        this.sample = sample;
        this.test = test;
        this.id = new TestEffectueId(sample.getId(),test.getId());
    }

    public TestEffectueId getId() {
        return id;
    }

    public TestEffectue setId(TestEffectueId id) {
        this.id = id;
        return this;
    }

    public Sample getSample() {
        return sample;
    }

    public TestEffectue setSample(Sample sample) {
        this.sample = sample;
        return this;
    }

    public Test getTest() {
        return test;
    }

    public TestEffectue setTest(Test test) {
        this.test = test;
        return this;
    }

//    public Result getResult() {
//        return result;
//    }
//
//    public TestEffectue setResult(Result result) {
//        this.result = result;
//        return this;
//    }

    public Date getCreatedOn() {
        return createdOn;
    }

    public TestEffectue setCreatedOn(Date createdOn) {
        this.createdOn = createdOn;
        return this;
    }

    public Date getUpdatedOn() {
        return updatedOn;
    }

    public TestEffectue setUpdatedOn(Date updatedOn) {
        this.updatedOn = updatedOn;
        return this;
    }

    public Device getDeviceUsed() {
        return deviceUsed;
    }

    public TestEffectue setDeviceUsed(Device deviceUsed) {
        this.deviceUsed = deviceUsed;
        return this;
    }

    public boolean isAlive() {
        return statutVie;
    }

    public TestEffectue setStatutVie(boolean statutVie) {
        this.statutVie = statutVie;
        return this;
    }
    
    
    @Override
    public boolean equals(Object obj){
        
          if(this == obj)
              return true;
          if(obj==null || getClass()!=obj.getClass())
              return false;
          TestEffectue te = (TestEffectue) obj;
          return Objects.equals(sample, te.sample) && Objects.equals(test, te.test);
    }
    
    @Override
    public int hashCode(){
        return Objects.hash(sample, test);
    }
    
}

