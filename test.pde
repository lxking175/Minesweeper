int horizontal= 9;
int vertical = 9;
int mineCount = 10;
float tileSize;
ArrayList<ArrayList<Tile>> tiles = new ArrayList<ArrayList<Tile>>();

void setup() {
  size(800, 800);
  tileSize = float(width)/(max(horizontal, vertical));

  for (int i = 0; i < horizontal; i++) {
    tiles.add(new ArrayList<Tile>());
    for (int j = 0; j < vertical; j++) {
      tiles.get(i).add(new Tile(i, j));
    }
  }
  for (int i = 1; i <= mineCount; ) {
    int temp2 = int(random(tiles.size()));
    int temp = int(random(tiles.get(0).size()));
    if (tiles.get(temp2).get(temp).bombs == 0) {
      tiles.get(temp2).get(temp).bombAdd();
      i++;
    }
  }
  for (int i = 0; i < horizontal; i++) {
    for (int j = 0; j < vertical; j++) {
      if (tiles.get(i).get(j).bombs == 0) {
        int temp = 0;
        for (int h = -1; h <= 1; h++) {
          for (int k = -1; k <= 1; k++) {
            try {
              temp += tiles.get(i+h).get(j+k).bombs;
            }
            catch (Exception e) {
            }
          }
        }
        tiles.get(i).get(j).number = temp;
      }
    }
  }
}

void draw() {
  background(255);
  for (int i = 0; i < horizontal; i++) {
    for (int j = 0; j < vertical; j++) {
      tiles.get(i).get(j).render();
    }
  }
}
