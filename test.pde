float c;
void setup() {
  size(400,400);
  c = 255;
}

void draw() {
  background(c);
  if (c>=1) {
    c= c - 0.2;
  }
  println(c);
}
