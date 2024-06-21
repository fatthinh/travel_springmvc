/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.lpthinh.services;

import com.lpthinh.pojo.Destination;
import java.util.List;
import java.util.Map;

/**
 *
 * @author admin
 */
public interface DestinationService {

    List<Destination> getDestinations(Map<String, String> params);
    
    void addOrUpdate(Destination destination);
    
    Destination getById(int id);
}
