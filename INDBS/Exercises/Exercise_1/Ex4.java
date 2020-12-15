import java.util.Map;
import java.util.List;
import java.util.Collectors;
import java.util.ArrayList;

public class Ex4 {
  class Dish {
    double price;
    String name;
    Map<Ingredient,Quantity> ingredients; 
  }

  class Ingredient {
    String name;

    public Ingredient (String name) {
      this.name = name;
    }

    public override boolean equals (Object other) {
      if (!other instanceof Ingredient) return false;
      var ing = (Ingredient) other;
      return name.equals(ing.name);
    }
  }

  class Supplier {
    Map<Ingredient,Quantity> stock;
  }

  class Quantity {
    Unit unit;
    double amount;

    enum Unit {
      LITER,
      GRAM,
      COUNT 
    }
  }

  class ForSale {
    Dish dish;
    Price price;
  }

  List<Dish> dishes;
  List<Ingredient> ingredients;
  List<Supplier> suppliers;
  Map<Date,Map<ForSale,Integer>> sales;
 
  public static void main(String[] args) {
    var ex = new Ex4(); 

    // find all dishes containing eggs
    var has_eggs = dishes.stream()
          .filter(d -> d.keySet().contains(new Ingredent("egg")))
          .collect(Collectors.toList(ArrayList::new));

    var today = magic.getToday();
    var sales_of_today = sales.get(today).keySet().stream()
                              .map(k -> sales.get(today).get(k) * k.price)
                              .collect((a,b,0) -> a + b);

    var most_sold = sales
  }
}
