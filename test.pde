int horizontal= 9;
int vertical = 9;
int mineCount = 10;
float tileSize;
ArrayList<Tile> tiles = new ArrayList<Tile>();

void setup() {
  size(800, 800);
  tileSize = float(width)/(max(horizontal,vertical));
  
  for (int i = 0; i < horizontal; i++){
    for (int j = 0; j < vertical; j++) {
      tiles.add(new Tile(i,j));
    }
  }
  for (int i = 1; i <= mineCount;) {
    int temp = int(random(tiles.size()));
    if (tiles.get(temp).bombs == 0){
      tiles.get(temp).bombAdd();
      i++;
    }
  }
  for (int i = 0; i < horizontal*vertical; i++){
    if (tiles.get(i).bombs == 0) {
      int temp = 0;
      try {
        temp += tiles.get(i-10).bombs;
      } catch (Exception e) {}
      try {
        temp += tiles.get(i-9).bombs;
      } catch (Exception e) {}
      try {
        temp += tiles.get(i-8).bombs;
      } catch (Exception e) {}
      try {
        temp += tiles.get(i-1).bombs;
      } catch (Exception e) {}
      try {
        temp += tiles.get(i+1).bombs;
      } catch (Exception e) {}
      try {
        temp += tiles.get(i+8).bombs;
      } catch (Exception e) {}
      try {
        temp += tiles.get(i+9).bombs;
      } catch (Exception e) {}
      try {
        temp += tiles.get(i+10).bombs;
      } catch (Exception e) {}
      print(temp);
      tiles.get(i).number = temp;
    }
  }
  
}

void draw() {
  background(255);
  for (int i = 0; i < (horizontal*vertical); i++) {
    tiles.get(i).render();
  }
}
