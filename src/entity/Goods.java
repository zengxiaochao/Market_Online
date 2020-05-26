package entity;

public class Goods {
    private int num;
    private int sales;
    private String goods_name;
    private double price;

    public void setGoods_name(String goods_name) {
        this.goods_name = goods_name;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public void setSales(int sales) {
        this.sales = sales;
    }

    public double getPrice() {
        return price;
    }

    public int getNum() {
        return num;
    }

    public int getSales() {
        return sales;
    }

    public String getGoods_name() {
        return goods_name;
    }

    /*
     * 获取货物图片的URL
     * */
    public String getGoods_url(String name)
    {

        return "./image/"+name+".jpg";
    }
}
