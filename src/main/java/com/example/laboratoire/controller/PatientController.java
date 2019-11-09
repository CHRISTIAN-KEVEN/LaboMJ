/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.laboratoire.controller;

import com.example.laboratoire.model.Patient;
import com.example.laboratoire.model.Sexe;
import com.example.laboratoire.model.Sigle;
import com.example.laboratoire.repository.PatientRepository;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author CHRISTIAN
 */

@RestController
public class PatientController {
    
    @Autowired
    PatientRepository patientRepo;
    
   @RequestMapping("/patients")
   public List<Patient> index(){
       
       List<Patient> list = new ArrayList();
       patientRepo.findByStatutVie(true).forEach(list::add);
       
       return list;
   }
   
   @RequestMapping("/patients/{id}")
   public Patient show(@PathVariable int id){
       
       return patientRepo.findById(id).get();
   }
   
   @RequestMapping(value="/{sexId}/{sigleId}/patients", method = RequestMethod.POST)
   public Patient store(@RequestBody Patient patient, @PathVariable("sexId") int sexId, @PathVariable("sigleId") int sigleId){
       
       Patient p = patientRepo.save(
              (Patient) patient.setStatutVie(true)
                               .setSex(new Sexe(sexId))
                               .setSigle(new Sigle(sigleId))
                               .setCreatedOn(new Date())
                               .setUpdatedOn(new Date())
       );
       
      return  patientRepo.save(
            (Patient)  p.setCodeUtilisateur("MJ"+ p.getId())
      );
       
   }
   
   @RequestMapping(value="/patients/{id}", method = RequestMethod.PUT)
   public Patient update(@RequestBody Patient patient, @PathVariable("sexId") int sexId, @PathVariable("sigleId") int sigleId){
       
       return patientRepo.save(
              (Patient) patient.setStatutVie(true)
                               .setSex(new Sexe(sexId))
                               .setSigle(new Sigle(sigleId))
                               .setUpdatedOn(new Date())
       );
   }
   

   @RequestMapping(value="/patients/{id}", method = RequestMethod.DELETE)
   public Patient delete(@PathVariable int id){
       
       return (Patient)patientRepo.findById(id).get()
               .setStatutVie(false);
       
   }
}
