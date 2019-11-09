/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.laboratoire.controller;

import com.example.laboratoire.model.Patient;
import com.example.laboratoire.model.Sample;
import com.example.laboratoire.model.SampleType;
import com.example.laboratoire.model.Test;
import com.example.laboratoire.model.TestEffectue;
import com.example.laboratoire.repository.PatientRepository;
import com.example.laboratoire.repository.SampleRepository;
import com.example.laboratoire.repository.SampleTypeRepository;
import com.example.laboratoire.repository.TestRepository;
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
public class SampleController {
    
    @Autowired
    SampleRepository sampleRepo;
    @Autowired
    TestRepository testRepo;
    @Autowired
    SampleTypeRepository stRepo;
    @Autowired
    PatientRepository patientRepo;
    
   @RequestMapping("/samples")
   public List<Sample> index(){
       
       List<Sample> list = new ArrayList();
       
       // Removing samples from tests returned to avoid recursion
       Iterable<Sample> samples = sampleRepo.findByStatutVie(true);
       for(Sample s: samples){
           List<TestEffectue> tes = s.getTestsEffectues();
           s.setTestsEffectues(null);
           for(TestEffectue te: tes){
               //te.setSample(null);
               te.getTest().setTestsEffectues(null);
           }
           s.setTestsEffectues(tes);
           
//           tes.stream().map((te) -> {
//               te.setSample(null);
//               return te;
//           }).forEachOrdered((te) -> {
//               te.getTest().setTestsEffectues(tes);
//           });
            list.add(s);
       }
     
      // samples.forEach(list::add);
       
       return list;
   }
   
   @RequestMapping("/samples/{id}")
   public Sample show(@PathVariable Long id){
       
       return sampleRepo.findById(id).get();
   }
   
   @RequestMapping(value="patients/{patientId}/samples", method = RequestMethod.POST)
   public Sample store(@RequestBody Sample pan, @PathVariable("patientId") int patientId){
       
       List<Long> testIds = pan.getTestIds();
       
       testRepo.findAllById(testIds).forEach(pan::addTest);
       
//       for(Long t: testIds){
//           pan.addTest(new Test(t));
//       }         
       return sampleRepo.save(
               
               pan.setStatutVie(true)
                  .setSampleType(stRepo.findById(pan.getSampleTypeId()).get())
                  .setPatient(patientRepo.findById(patientId).get())
                  .setCreatedOn(new Date())
                  .setUpdatedOn(new Date())
       );
   }
   
   @RequestMapping(value="/samples/{id}", method = RequestMethod.PATCH)
   public Sample update(@RequestBody Sample sample){
       
       return sampleRepo.save(sample.setUpdatedOn(new Date()));
   }
   

   @RequestMapping(value="/samples/{id}", method = RequestMethod.DELETE)
   public Sample delete(@PathVariable Long id){
       
       return sampleRepo.findById(id).get()
               .setStatutVie(false);
       
   }
}
