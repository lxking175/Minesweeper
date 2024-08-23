int horizontal= 8;
int vertical = 8;
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
  
  
}

void draw() {
  background(255);
  for (int i = 0; i < (horizontal*vertical); i++) {
    tiles.get(i).render();
  }
}
