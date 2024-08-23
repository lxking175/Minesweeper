class Tile {
  PVector drawPos;
  PVector pos;
  int bombs;
  
  Tile(int x, int y) {
    bombs = int(random(2));
    pos = new PVector(x,y);
  }
  
  int bombCount() {
    return bombs;
  }
  
  void render() {
    rect(pos.x*tileSize, pos.y*tileSize, tileSize, tileSize);
  }
}
