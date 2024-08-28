class Tile {
  PVector drawPos;
  PVector pos;
  int bombs = 0;
  int number = 0;
  boolean covered = true;
  boolean flagged = false;

  Tile(int x, int y) {
    pos = new PVector(x, y);
  }

  void bombAdd() {
    bombs += 1;
  }

  void numberSet(int n) {
    number = n;
  }

  void render() {
    textSize(50);
    rect(pos.x*tileSize, pos.y*tileSize, tileSize, tileSize);
    fill(150);
    rect(pos.x*tileSize, pos.y*tileSize, tileSize, tileSize);
    fill(0);
    if (bombs == 1) {
      rect(tileSize*pos.x+(tileSize/4), tileSize*pos.y+(tileSize/4), tileSize/2, tileSize/2);
    }
    if (covered) {
      fill(200);
      rect(pos.x*tileSize, pos.y*tileSize, tileSize, tileSize);
    } else {
      if (bombs == 0) {
        text(number, (pos.x)*tileSize, (pos.y+1)*tileSize);
      }
    }
  }
}
