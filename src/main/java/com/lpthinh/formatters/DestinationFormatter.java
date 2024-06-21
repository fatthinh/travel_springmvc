/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.lpthinh.formatters;

import com.lpthinh.pojo.Destination;
import java.text.ParseException;
import java.util.Locale;
import org.springframework.format.Formatter;

/**
 *
 * @author admin
 */
public class DestinationFormatter implements Formatter<Destination> {

    @Override
    public String print(Destination destination, Locale locale) {
        return String.valueOf(destination.getId());
    }

    @Override
    public Destination parse(String id, Locale locale) throws ParseException {
        Destination destination = new Destination();
        destination.setId(Integer.parseInt(id));

        return destination;
    }
}
