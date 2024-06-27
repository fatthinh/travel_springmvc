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
public class UserDTO {

    private String firstName;
    private String lastName;
    private String email;
    private String phone;
    private String password;
    private String confirmPassword;
    private String role;

    public UserDTO() {
    }

}
