/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DBAccess;

import BasicObject.FAQ;
import MyLib.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author green
 */
public class FAQsDAO {

    public static int addFAQ(String name, String content, int idItem) {
        try {
            int rs = 0;
            Connection cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "insert into [dbo].[FAQ]([CustName],[CustContent],[ItemId]) values (?,?,?)";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, name);
                pst.setString(2, content);
                pst.setInt(3, idItem);
                rs = pst.executeUpdate();
                cn.close();
            }
            return rs;
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }

    public static ArrayList<FAQ> getAllFAQsByItem(int itemid) {
        try {
            ArrayList<FAQ> list = new ArrayList<>();
            Connection cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select [Id],[CustName],[CustContent],[ItemId] from [dbo].[FAQ] where [ItemId]=?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, itemid);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int id = rs.getInt("Id");
                        String name = rs.getString("CustName");
                        String content = rs.getString("CustContent");
                        int idItem = rs.getInt("ItemId");

                        FAQ faq = new FAQ(id, name, content, idItem);
                        list.add(faq);
                    }
                }
                cn.close();
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
