/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.laboratoire.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Objects;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


/**
 *
 * @author CHRISTIAN
 */

@Entity
@Table(name="test")
//@org.hibernate.annotations.NaturalIdCache
//@org.hibernate.annotations.Cache(
//    usage = org.hibernate.annotations.CacheConcurrencyStrategy.READ_WRITE
//)
public class Test {
 /* This is to hold */   
    @javax.persistence.Transient
    private List<Integer> panelIds ;

    public List<Integer> getPanelIds() {
        return panelIds;
    }

    public void setPanelIds(List<Integer> testIds) {
        this.panelIds = testIds;
    }
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    //@NaturalId
    private String name;
    private String description;
    private String unitOfMeasurement; // May be changed later to separate table
    private long price;
    
    @OneToMany(mappedBy = "test")
    private List<ValeurDeReference> valeurDereferences;
    
    @ManyToMany
    @JsonIgnoreProperties("testsThatCanBeConducted")
    private List<SampleType> sampleTypes; // May not be used now
    
    @ManyToOne
    @JoinColumn(name="section_id")
    @JsonIgnoreProperties("tests")
    private Section section;
    
    @Column(name="created_on")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createdOn;
    
    @Column(name="updated_on")
    @Temporal(TemporalType.TIMESTAMP)
    private Date updatedOn;
    @Column(name="statut_vie")
    @JsonIgnore
    private boolean statutVie;
    @OneToMany( mappedBy = "test", cascade = CascadeType.ALL, orphanRemoval = true)//@JsonIgnoreProperties("test")
    @JsonIgnoreProperties("test")
    private List<TestEffectue> testsEffectues = new ArrayList();
    
    @ManyToMany
    @JsonIgnore
    private List<Panel> panels;
    
    public Test() {
    }

    public Test(Long id){
        this.id = id;
        this.testsEffectues = new ArrayList();
    }
    
    public Test(Long id, String name, String description, String unitOfMeasurement, long price, List<ValeurDeReference> valeurDereferences, List<SampleType> sampleTypes, Section section, Date createdOn, Date updatedOn, boolean statutVie, List<Panel> panels) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.unitOfMeasurement = unitOfMeasurement;
        this.price = price;
        this.valeurDereferences = valeurDereferences;
        this.sampleTypes = sampleTypes;
        this.section = section;
        this.createdOn = createdOn;
        this.updatedOn = updatedOn;
        this.panels = panels;
        this.statutVie = statutVie;
    } 

    public Long getId() {
        return id;
    }

    public Test setId(Long id) {
        this.id = id;
        return this;
    }

    public String getName() {
        return name;
    }

    public Test setName(String name) {
        this.name = name;
        return this;
    }

    public String getDescription() {
        return description;
    }

    public Test setDescription(String description) {
        this.description = description;
        return this;
    }


    public String getUnitOfMeasurement() {
        return unitOfMeasurement;
    }

    public Test setUnitOfMeasurement(String unitOfMeasurement) {
        this.unitOfMeasurement = unitOfMeasurement;
        return this;
    }

    public long getPrice() {
        return price;
    }

    public Test setPrice(long price) {
        this.price = price;
        return this;
    }

    public List<ValeurDeReference> getValeurDereferences() {
        return valeurDereferences;
    }

    public Test setValeurDereferences(List<ValeurDeReference> valeurDereferences) {
        this.valeurDereferences = valeurDereferences;
        return this;
    }

    public Section getSection() {
        return section;
    }

    public Test setSection(Section section) {
        this.section = section;
        return this;
    }

    public Date getCreatedOn() {
        return createdOn;
    }

    public Test setCreatedOn(Date createdOn) {
        this.createdOn = createdOn;
        return this;
    }

    public Date getUpdatedOn() {
        return updatedOn;
    }

    public Test setUpdatedOn(Date updatedOn) {
        this.updatedOn = updatedOn;
        return this;
    }

    public List<SampleType> getSampleTypes() {
        return sampleTypes;
    }

    public Test setSampleTypes(List<SampleType> sampleTypes) {
        this.sampleTypes = sampleTypes;
        return this;
    }

    public List<TestEffectue> getTestsEffectues() {
        return this.testsEffectues;
    }

    public Test setTestsEffectues(List<TestEffectue> samples) {
        this.testsEffectues = samples;
        return this;
    }

    public List<Panel> getPanels() {
        return panels;
    }

    public Test setPanels(List<Panel> panels) {
        this.panels = panels;
        return this;
    }

    public boolean isAlive() {
        return statutVie;
    }

    public Test setStatutVie(boolean statutVie) {
        this.statutVie = statutVie;
        return this;
    }
    
    
    
    
    
    
    //*******************************************************************//
    // Attaching and Detaching tests from samples
//    
//     public void addSample(Sample sample) {
//        TestEffectue testAeffectuer = new TestEffectue(sample, this);
//        testsEffectues.add(testAeffectuer);
//        sample.getTestsEffectues().add(testAeffectuer);
//    }
// 
//    public void removeTest(Sample sample) {
//        for (Iterator<TestEffectue> iterator = testsEffectues.iterator();
//             iterator.hasNext(); ) {
//            TestEffectue te = iterator.next();
// 
//            if (te.getTest().equals(this) &&
//                    te.getSample().equals(sample)) {
//                iterator.remove();
//                te.getSample().getTestsEffectues().remove(te);
//                te.setTest(null);
//                te.setSample(null);
//            }
//        }
//    }
    
    //********************************************************//
    
    
    
    
    
    
    
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Test t = (Test) o;
        return Objects.equals(name, t.name);
    }
 
    @Override
    public int hashCode() {
        return Objects.hash(name);
    }
    
    
}
