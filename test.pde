int horizontal= 9;
int vertical = 9;
int mineCount = 10;
float tileSize;
ArrayList<ArrayList<Tile>> tiles = new ArrayList<ArrayList<Tile>>();
boolean dead = false;
int tilesOpen = 0;

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
  if (tilesOpen == (horizontal*vertical) - mineCount) {
    clearedBoard();
  }
}

void hitBomb() {
  println("lose");
  for (int i = 0; i < horizontal; i++) {
    for (int j = 0; j < vertical; j++) {
      if (tiles.get(i).get(j).bombs > 0) {
        tiles.get(i).get(j).covered = false;
      }
    }
  }
}

void clearedBoard() {
  println("win");
}

void openZero(int i, int j) {
  for (int h = -1; h <= 1; h++) {
    for (int k = -1; k <= 1; k++) {
      try {

        if (tiles.get(i+h).get(j+k).number == 0 && tiles.get(i+h).get(j+k).covered == true) {
          if (tiles.get(i+h).get(j+k).covered == true) {
            tiles.get(i+h).get(j+k).covered = false;
            tilesOpen += 1;
          }
          openZero(i+h, j+k);
        }
        if (tiles.get(i+h).get(j+k).covered == true) {
          tiles.get(i+h).get(j+k).covered = false;
          tilesOpen += 1;
        }
      }
      catch (Exception e) {
      }
    }
  }
}

void mousePressed() {
  println();
  println(tilesOpen);
  for (int i = 0; i < horizontal; i++) {
    for (int j = 0; j < vertical; j++) {
      Tile tile = tiles.get(i).get(j);
      float xPos = tile.pos.x*tileSize;
      float yPos = tile.pos.y*tileSize;
      if ((mouseX >= xPos && mouseX < xPos+tileSize) && (mouseY >= yPos && mouseY < yPos+tileSize) && (tile.covered == true)) {
        tile.covered = false;
        if (tile.bombs > 0) {
          hitBomb();
          return;
        }
        if (tile.number == 0 && tile.bombs == 0) {
          openZero(i, j);
        }
        tilesOpen += 1;
        return;
      }
    }
  }
}
