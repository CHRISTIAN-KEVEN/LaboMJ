/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.laboratoire.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author CHRISTIAN
 */
@Entity
@Table(name="result")
public class Result {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(name="valeur_numeric")
    private double valeurNumeric;
    @Column(name="valeur_caractere")
    private String valeurCaractere;
    private String notes;
    @Column(name="attached_file")
    private String attachedFile;
    private boolean abnormal;
    private boolean rejected; // accepted or rejected
    private String inference; // Added by the Director
    
    @ManyToOne
    private Employee validator;
    
//    @OneToOne
//    @JsonIgnore
//    private TestEffectue testEffectue;  This was changed to sample cuz was difficult to see how to insert new
    //                                      rows during one during one form submition since a form submition usually saves
                                           //  only one Entity.
    
    @ManyToOne
    private Sample sample;
    
    @Column(name="created_on")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createdOn;
    @Column(name="updated_on")
    @Temporal(TemporalType.TIMESTAMP)
    private Date updatedOn;
    @JsonIgnore
    @Column(name="statutVie")
    private boolean statutVie;
    
    // @Column(name = "referred_out")
    // private boolean referredOut;
    // @Column(name = "referral_reason") OF type TEXT
    // private String referralReason;

    public Result() {
    }
    
    public Result(int id){
        this.id = id;
        this.valeurCaractere = "";
        this.valeurNumeric = 0.0;
        
    }

    public Result(int id, double valeur, String valeurCaractere, String notes, String attachedFile, boolean abnormal, boolean rejected, Employee validatedBy, Sample sample) {
        this.id = id;
        this.valeurNumeric = valeur;
        this.valeurCaractere = valeurCaractere;
        this.notes = notes;
        this.attachedFile = attachedFile;
        this.abnormal = abnormal;
        this.rejected = rejected;
        this.validator = validatedBy;
        this.sample = sample;
    }


    public int getId() {
        return id;
    }

    public Result setId(int id) {
        this.id = id;
        return this;
    }

    public double getValeurNumeric() {
        return valeurNumeric;
    }

    public Result setValeurNumeric(double value) {
        this.valeurNumeric = value;
        return this;
    }
    
    public String getValeurCaractere(){
        return this.valeurCaractere;
    }
    public Result setValeurCaractere(String s){
        this.valeurCaractere = s;
        return this;
    }

    public String getNotes() {
        return notes;
    }

    public Result setNotes(String notes) {
        this.notes = notes;
        return this;
    }

    public String getAttachedFile() {
        return attachedFile;
    }

    public Result setAttachedFile(String attachedFile) {
        this.attachedFile = attachedFile;
        return this;
    }

    public boolean isAbnormal() {
        return abnormal;
    }

    public Result setAbnormal(boolean abnormal) {
        this.abnormal = abnormal;
        return this;
    }

    public Sample getSample() {
        return this.sample;
    }

    public Result setSample(Sample s) {
        this.sample = s;
        return this;
    }

    public boolean isRejected() {
        return rejected;
    }

    public Result setRejected(boolean rejected) {
        this.rejected = rejected;
        return this;
    }

    public Employee getValidatedBy() {
        return validator;
    }

    public Result setValidatedBy(Employee validatedBy) {
        this.validator = validatedBy;
        return this;
    }

    public Employee getValidator() {
        return validator;
    }

    public Result setValidator(Employee validator) {
        this.validator = validator;
        return this;
    }

    public Date getCreatedOn() {
        return createdOn;
    }

    public Result setCreatedOn(Date createdOn) {
        this.createdOn = createdOn;
        return this;
    }

    public Date getUpdatedOn() {
        return updatedOn;
    }

    public Result setUpdatedOn(Date updatedOn) {
        this.updatedOn = updatedOn;
        return this;
    }

    public boolean isAlive() {
        return statutVie;
    }

    public Result setStatutVie(boolean statutVie) {
        this.statutVie = statutVie;
        return this;
    }
           
}