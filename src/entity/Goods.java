package entity;

public class Goods {
    private int num;//库存
    private int sales;//销量
    private String goods_name;//名字
    private double price;//价格
    private String icon_url;//图
    private String details_text;//详情
    private String details_img_url;//详情图
    private String spec;//规格
    private int project_id;
    private String project_deleted;

    public String getProject_deleted() {
        return project_deleted;
    }

    public void setProject_deleted(String project_deleted) {
        this.project_deleted = project_deleted;
    }

    public int getProject_id() {
        return project_id;
    }

    public void setProject_id(int project_id) {
        this.project_id = project_id;
    }

    public String getIcon_url() {
        return icon_url;
    }

    public void setIcon_url(String icon_url) {
        this.icon_url = icon_url;
    }

    public String getDetails_text() {
        return details_text;
    }

    public void setDetails_text(String details_text) {
        this.details_text = details_text;
    }

    public String getDetails_img_url() {
        return details_img_url;
    }

    public void setDetails_img_url(String details_img_url) {
        this.details_img_url = details_img_url;
    }

    public String getSpec() {
        return spec;
    }

    public void setSpec(String spec) {
        this.spec = spec;
    }



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

}
