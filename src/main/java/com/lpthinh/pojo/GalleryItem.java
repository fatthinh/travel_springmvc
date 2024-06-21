/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.lpthinh.pojo;

/**
 *
 * @author admin
 */
@lombok.Getter
@lombok.Setter
public class GalleryItem {

    private Object first_obj;
    private Object second_obj;

    public GalleryItem() {
    }

    public GalleryItem(Object first_obj, Object second_obj) {
        this.first_obj = first_obj;
        this.second_obj = second_obj;
    }
}
