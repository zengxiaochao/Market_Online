package entity;

import java.time.LocalDateTime;

public class Indent {
    String create_time;
    String indent_id;
    String money;
    String goods_kind;
    String user_name;
    String user_address;
    public String getUser_name() {
        return user_name;
    }

    public void setMoney(String money) {
        this.money = money;
    }

    public String getMoney() {
        return money;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getGoods_kind() {
        return goods_kind;
    }

    public void setGoods_kind(String goods_kind) {
        this.goods_kind = goods_kind;
    }

    public String getCreate_time() {
        return create_time;
    }

    public void setCreate_time(String create_time) {
        this.create_time = create_time;
    }

    public String getIndent_id() {
        return indent_id;
    }

    public void setIndent_id(String indent_id) {
        this.indent_id = indent_id;
    }

    public void setUser_address(String user_address) {
        this.user_address = user_address;
    }

    public String getUser_address() {
        return user_address;
    }
}
