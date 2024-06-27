/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.lpthinh.formatters;

import com.lpthinh.pojo.TicketType;
import java.text.ParseException;
import java.util.Locale;
import org.springframework.format.Formatter;

/**
 *
 * @author admin
 */
public class TicketTypeFormatter implements Formatter<TicketType> {

    @Override
    public String print(TicketType type, Locale locale) {
        return String.valueOf(type.getId());
    }

    @Override
    public TicketType parse(String id, Locale locale) throws ParseException {
        TicketType type = new TicketType();
        type.setId(Integer.parseInt(id));

        return type;
    }

}