/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Tavleen
 */
public class ReadFromPropertyFile {

    Properties prop = null;
    InputStream is = null;

    public ReadFromPropertyFile() {
        try {
            prop = new Properties();
            is = this.getClass().getResourceAsStream("prop.properties");
        } catch (Exception e) {
        }
    }
    String link1, link2, path, email, password;

    public String getEmail() {
        try {
            prop.load(is);
            email = prop.getProperty("email");
        } catch (IOException ex) {
            Logger.getLogger(ReadFromPropertyFile.class.getName()).log(Level.SEVERE, null, ex);
        }

        return email;
    }
    
    

    public InputStream getIs() {
        return is;
    }

    public String getLink1() {
        try {
            prop.load(is);
            link1 = prop.getProperty("link1");
        } catch (IOException ex) {
            Logger.getLogger(ReadFromPropertyFile.class.getName()).log(Level.SEVERE, null, ex);
        }
        return link1;
    }

    public String getPassword() {
        try {
            prop.load(is);
            password = prop.getProperty("password");
        } catch (IOException ex) {
            Logger.getLogger(ReadFromPropertyFile.class.getName()).log(Level.SEVERE, null, ex);
        }
        return password;
    }

    public String getPath() {
        try {
            prop.load(is);
            path = prop.getProperty("path");
        } catch (IOException ex) {
            Logger.getLogger(ReadFromPropertyFile.class.getName()).log(Level.SEVERE, null, ex);
        }
        return path;
    }

    public String getLink2() {
         try {
            prop.load(is);
            link2 = prop.getProperty("link2");
        } catch (IOException ex) {
            Logger.getLogger(ReadFromPropertyFile.class.getName()).log(Level.SEVERE, null, ex);
        }
        return link2;
    }

    public Properties getProp() {
        return prop;
    }
}
