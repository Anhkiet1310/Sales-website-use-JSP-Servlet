/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BasicObject;

/**
 *
 * @author green
 */
public class Items {
    private int itemID;
    private String itemName;
    private int price;
    private int cateID;
    private String image;

    public Items(int itemID, String itemName, int price, int cateID, String image) {
        this.itemID = itemID;
        this.itemName = itemName;
        this.price = price;
        this.cateID = cateID;
        this.image = image;
    }

    public int getItemID() {
        return itemID;
    }

    public void setItemID(int itemID) {
        this.itemID = itemID;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getCateID() {
        return cateID;
    }

    public void setCateID(int cateID) {
        this.cateID = cateID;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
    
}
