/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.laboratoire.model;

import java.io.Serializable;
import java.util.Objects;
import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 *
 * @author CHRISTIAN
 */
@Embeddable
public class TestEffectueId implements Serializable{
    
    @Column(name="sample_id")
    private Long sampleId;
    
    @Column(name="test_id")
    private Long testId;

    public TestEffectueId() {
    }

    public TestEffectueId(Long sampleId, Long testId) {
        this.testId = testId;
        this.sampleId = sampleId;
    }

    public Long getTestId() {
        return testId;
    }

    public Long getSampleId() {
        return sampleId;
    }
    
    @Override
    public boolean equals(Object obj){
        
          if(this == obj)
              return true;
          if(obj==null || getClass()!=obj.getClass())
              return false;
          TestEffectueId tei = (TestEffectueId) obj;
          return Objects.equals(sampleId, tei.sampleId) && Objects.equals(testId, tei.testId);
    }
    
    @Override
    public int hashCode(){
        return Objects.hash(sampleId, testId);
    }
    
    
}
