/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DBAccess;

import BasicObject.Items;
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
public class ItemDAO {

    public static ArrayList<Items> getAllItem() throws Exception {
        ArrayList<Items> list = new ArrayList<>();
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "select [ItemId],[ItemName],[Price],[CateId],[Image] from [dbo].[Items]";
            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            if (rs != null) {
                while (rs.next()) {
                    int id = rs.getInt("ItemId");
                    String name = rs.getString("ItemName");
                    int price = rs.getInt("Price");
                    int cateID = rs.getInt("CateId");
                    String image = rs.getString("image");
                    Items item = new Items(id, name, price, cateID, image);
                    list.add(item);
                }
            }
            cn.close();
        }
        return list;
    }
    
    public static Items getItemById(int idItem) throws Exception{
        Items item=null;
        Connection cn =DBUtils.makeConnection();
        if(cn!=null){
            String sql="select [ItemId],[ItemName],[Price],[CateId],[Image] from [dbo].[Items] where [ItemId]=?";
            PreparedStatement pst=cn.prepareStatement(sql);
            pst.setInt(1, idItem);
            ResultSet rs =pst.executeQuery();
            if(rs!=null){
                while(rs.next()){
                    int id = rs.getInt("ItemId");
                    String name=rs.getString("ItemName");
                    int price =rs.getInt("Price");
                    int cateId=rs.getInt("CateId");
                    String image = rs.getString("Image");
                    item=new Items(id, name, price, cateId, image);
                }
            }
            cn.close();
        }
        
        return item;
    }
    
    public static int updateItem(int id, String name, int price, int cateid, int idupdate, String image) throws Exception{
        int rs=0;
        Connection cn =DBUtils.makeConnection();
        if(cn!=null){
            String sql="update [dbo].[Items] set [ItemId]=?,[ItemName]=? ,[Price]=? ,[CateId]=?, [Image]=? where [ItemId]=?";
            PreparedStatement pst=cn.prepareStatement(sql);
            pst.setInt(1, id);
            pst.setString(2, name);
            pst.setInt(3, price);
            pst.setInt(4, cateid);
            pst.setString(5, image);
            pst.setInt(6, idupdate);
            rs=pst.executeUpdate();
        }
        return rs;
    }
    
    public static int deleteItem(int id) {
        int rs=0;
        try {
            Connection cn=DBUtils.makeConnection();
        if(cn!=null){
            String sql="delete from [dbo].[Items] where [ItemId]=?";
            PreparedStatement pst=cn.prepareStatement(sql);
            pst.setInt(1, id);
            rs=pst.executeUpdate();
        }
        } catch (Exception e) {
            return rs;
        }
        return rs;
    }
    
    public static int addItem(int id, String name,int price,int cateid, String image){
        try {
            int rs=0;
        Connection cn=DBUtils.makeConnection();
        if(cn!=null){
            String sql= "insert into [dbo].[Items]([ItemId],[ItemName],[Price],[CateId],[Image]) values(?,?,?,?,?)";
            PreparedStatement pst=cn.prepareStatement(sql);
            pst.setInt(1, id);
            pst.setString(2, name);
            pst.setInt(3, price);
            pst.setInt(4, cateid);
            pst.setString(5, image);
            rs=pst.executeUpdate();
            cn.close();
        }
        return rs;
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }

}
