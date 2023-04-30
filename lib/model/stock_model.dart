class Stocks {
  String? date;
  String? type;
  String? name;
  String? unit;
  String? dynasty;
  String? price;

  Stocks(
      {this.date, this.type, this.name, this.unit, this.dynasty, this.price});

  factory Stocks.fromJson(Map<String, dynamic> json) {
    Stocks stock = Stocks();
    stock.date = json['stocmarket_date'];
    stock.type = json['stocmarket_type'];
    stock.name = json['company_name'];
    stock.unit = json['price_unit'];
    stock.dynasty = json['dynasty'];
    stock.price = json['price'];
    return stock;
  }
}
