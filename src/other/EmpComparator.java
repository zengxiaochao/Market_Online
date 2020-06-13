package other;

import entity.Goods;

import java.util.Comparator;

public class EmpComparator  implements Comparator<Goods> {
    @Override
    public int compare(Goods o1, Goods o2) {
        return o1.getSales()-o2.getSales();
    }
    public int compare1(Goods o1, Goods o2) {
       return o1.getNum()-o2.getNum();
    }
    public int compare2(Goods o1, Goods o2) {
        return o1.getSales()-o2.getSales();
    }
    public int compare3(Goods o1, Goods o2) {
        return o1.getSales()-o2.getSales();
    }
}
