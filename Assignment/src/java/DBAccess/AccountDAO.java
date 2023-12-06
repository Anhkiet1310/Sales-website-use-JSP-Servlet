/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DBAccess;

import BasicObject.Account;
import BasicObject.Items;
import MyLib.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class AccountDAO {

    public int createAccount(String username, String password) {
        try {
            int rs = 0;
            Connection cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "insert into [dbo].[Accounts]([Username],[Password]) values(?,?)";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, username);
                pst.setString(2, password);
                rs = pst.executeUpdate();
                cn.close();
            }
            return rs;
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }

    public boolean login(String username, String password) {
        try {
            Connection cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select [Username] from [dbo].[Accounts] where [Username]=? and [Password]=?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, username);
                pst.setString(2, password);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        String usernameDB = rs.getString("Username");
                        
                        // Nếu không có acc trong database => false
                        if (usernameDB == null) 
                            return false;
                        else
                            return true;
                        
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public static ArrayList<Account> getAll() throws Exception  {
        ArrayList<Account> list = new ArrayList<>();
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "select [UserId],[Username],[Password] from [dbo].[Accounts]";
            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            if (rs != null) {
                while (rs.next()) {
                    int id = rs.getInt("UserId");
                    String name = rs.getString("Username");
                    String password = rs.getString("Password");
                    
                    Account account = new Account(id, name, password);
                    list.add(account);
                }
            }
            cn.close();
        }
        return list;
    }
    
        public static int deleteAccount(int id) {
        int rs=0;
        try {
            Connection cn=DBUtils.makeConnection();
        if(cn!=null){
            String sql="delete from [dbo].[Accounts] where [UserId]=?";
            PreparedStatement pst=cn.prepareStatement(sql);
            pst.setInt(1, id);
            rs=pst.executeUpdate();
        }
        } catch (Exception e) {
            return rs;
        }
        return rs;
    }
}
