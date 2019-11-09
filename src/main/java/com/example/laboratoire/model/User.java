/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.laboratoire.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import java.util.Date;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.DiscriminatorColumn;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Size;

/**
 *
 * @author CHRISTIAN
 */
@Entity
@Table(name="user")
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(name="user_type")
public class User {
    
    @Id
    @GeneratedValue( strategy = GenerationType.IDENTITY)
    private int id;
    
    @Column(name="first_name")
    @Size(min=2, max=50, message="First name should be between 2 and 50 characters")
    private String firstName;
    
    @Size(min=2, max=50, message="Last name should be between 2 and 50 characters")
    @Column(name="last_name")
    private String lastName;

    @ManyToOne(cascade = CascadeType.ALL)
    @JsonIgnoreProperties("id")
    private Sigle sigle; //title
    
    @ManyToOne(cascade = CascadeType.ALL)
    @JsonIgnoreProperties("id")
    private Sexe sex;
    
    @Column(name="date_of_birth")
    @Temporal(TemporalType.DATE)
    private Date dateOfBirth;
    
    @Size(max=50, message="Too long, should be less than 50 characters")
    private String nationality;
    
    @Column(name="id_card_no")
    @Size(max=50, message="ID card number cannot be more than 50 characters")
    private String idCardNumber;
    
    private String picture;
    private String address;   // May have an address Table later so address will be of type Address
    private String phone;
    
    @Column(name="code_utilisateur")
    private String codeUtilisateur;
    
  //  private String role;  Role will be added to the the table to which the user belongs e.g. Employee
    private String email;
    private String password;
    
    @Column(name="created_on")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createdOn;
    
    @Column(name="updated_on")
    @Temporal(TemporalType.TIMESTAMP)
    private Date updatedOn;
    
    @Column(name="statut_vie")
    @JsonIgnore
    private boolean statutVie;
    

    public User() {
    }
    
    public User(int id){
        this.id = id;
    }

    public User(int id, String firstName, String lastName, Sigle sigle, Sexe sex, Date dateOfBirth, String nationality, String idCardNumber, String picture, String address, String phone, String codeUtilisateur, String email, String password, Date createdOn, Date updatedOn, boolean statutVie) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.sigle = sigle;
        this.sex = sex;
        this.dateOfBirth = dateOfBirth;
        this.nationality = nationality;
        this.idCardNumber = idCardNumber;
        this.picture = picture;
        this.address = address;
        this.phone = phone;
        this.codeUtilisateur = codeUtilisateur;
        this.email = email;
        this.password = password;
        this.createdOn = createdOn;
        this.updatedOn = updatedOn;
        this.statutVie = statutVie;
    }

    

    public int getId() {
        return id;
    }

    public User setId(int id) {
        this.id = id;
        return this;
    }

    public String getFirstName() {
        return firstName;
    }

    public User setFirstName(String firstName) {
        this.firstName = firstName;
        return this;
    }

    public String getLastName() {
        return lastName;
    }

    public User setLastName(String lastName) {
        this.lastName = lastName;
        return this;
    }

    public Date getDateOfBirth() {
        return dateOfBirth;
    }

    public User setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
        return this;
    }

    public String getNationality() {
        return nationality;
    }

    public User setNationality(String nationality) {
        this.nationality = nationality;
        return this;
    }

    public String getIdCardNumber() {
        return idCardNumber;
    }

    public User setIdCardNumber(String idCardNumber) {
        this.idCardNumber = idCardNumber;
        return this;
    }

    public String getPicture() {
        return picture;
    }

    public User setPicture(String picture) {
        this.picture = picture;
        return this;
    }

    public String getAddress() {
        return address;
    }

    public User setAddress(String address) {
        this.address = address;
        return this;
    }

    public String getPhone() {
        return phone;
    }

    public User setPhone(String phone) {
        this.phone = phone;
        return this;
    }

    public String getCodeUtilisateur() {
        return codeUtilisateur;
    }

    public User setCodeUtilisateur(String codeUtilisateur) {
        this.codeUtilisateur = codeUtilisateur;
        return this;
    }

    public String getEmail() {
        return email;
    }

    public User setEmail(String email) {
        this.email = email;
        return this;
    }

    public String getPassword() {
        return password;
    }

    public User setPassword(String password) {
        this.password = password;
        return this;
    }

    public Date getCreatedOn() {
        return this.createdOn;
    }

    public User setCreatedOn(Date createdOn) {
        this.createdOn = createdOn;
        return this;
    }

    public Date getUpdatedOn() {
        return this.updatedOn;
    }

    public User setUpdatedOn(Date updated_on) {
        this.updatedOn = updated_on;
        return this;
    }
    
    public boolean isAlive() {
        return this.statutVie;
    }

    public User setStatutVie(boolean statutVie) {
        this.statutVie = statutVie;
        return this;
    }

    public Sigle getSigle() {
        return sigle;
    }

    public User setSigle(Sigle sigle) {
        this.sigle = sigle;
        return this;
    }

    public Sexe getSex() {
        return sex;
    }

    public User setSex(Sexe sex) {
        this.sex = sex;
        return this;
    }
   
    
}
