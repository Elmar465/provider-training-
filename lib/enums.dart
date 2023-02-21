enum MyColors { red, orange, yellow, green, blue, indigo, violet }

class  Flower {
  final String name;
  final MyColors color;

  // ignore: non_constant_identifier_names
  Flower(this.name, this.color);
}

final myFlower = Flower('Rose', MyColors.blue);
void main() {
  if (myFlower.color == MyColors.red) {
    print('That is specific flower');
  } else {
    print('That is normal colors');
  }
}
