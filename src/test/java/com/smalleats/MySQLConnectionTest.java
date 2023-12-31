package com.smalleats;


import org.junit.Test;

import java.sql.Connection;
import java.sql.DriverManager;

public class MySQLConnectionTest {
    private static final String DRIVER ="net.sf.log4jdbc.sql.jdbcapi.DriverSpy";
    private static final String URL="jdbc:log4jdbc:mysql://127.0.0.1:3308/smalleatsDB";
    private static final String USER ="root";
    private static final String PASSWORD ="1234";

    @Test
    public void testConnetion() throws Exception{
        Class.forName(DRIVER);
        try (Connection connection = DriverManager.getConnection(URL,USER,PASSWORD)){
            System.out.println(connection);
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
