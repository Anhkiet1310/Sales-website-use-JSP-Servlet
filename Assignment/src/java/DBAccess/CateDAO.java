/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DBAccess;

import BasicObject.Categories;
import MyLib.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author green
 */
public class CateDAO {
    public static ArrayList<Categories> getAllCategorieses() throws Exception {
        ArrayList<Categories> list = new ArrayList<>();
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "select [CateId],[CateName],[Status] from [dbo].[Categories]";
            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            if (rs != null) {
                while (rs.next()) {
                    int id = rs.getInt("CateId");
                    String name = rs.getString("CateName");
                    boolean status = rs.getBoolean("Status");
                    Categories cate = new Categories(id, name, status);
                    list.add(cate);
                }
            }
            cn.close();
        }
        return list;
    }
    public static Categories getCateByID(int id) throws Exception{
        Categories categories= null;
        Connection cn= DBUtils.makeConnection();
        if(cn!=null){
            String sql="select [CateId],[CateName],[Status] from [dbo].[Categories] where [CateId]=?";
            PreparedStatement pst=cn.prepareStatement(sql);
            pst.setInt(1, id);
            ResultSet rs =pst.executeQuery();
            if(rs!=null){
                while(rs.next()){
                    int cid =rs.getInt("CateId");
                    String cname =rs.getString("CateName");
                    boolean cstatus =rs.getBoolean("Status");
                    categories = new Categories(cid, cname, cstatus);
                }
            }
            cn.close();
        }
        return categories;
    }
}
