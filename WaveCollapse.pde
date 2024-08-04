final int SIZE_X = 64, SIZE_Y = 64;
final int ARRAY_X = 16, ARRAY_Y = 16;

int startX, startY;
boolean gen = true;
Tile[][] tile = new Tile[16][16];

void setup(){
  size(1024,1024);
  startX = int(random(ARRAY_X));
  startY = int(random(ARRAY_Y));
  initTileList();
  background(0);
  fill(0,0,0,0);
}

void draw(){
  if(gen)delay(0);
  else{
    delay(500);
    reset();
  }
  background(0);
  resetWave();
  gen = waveCollapse(startX, startY);
  for(int x = 0; x < ARRAY_X; x++){
    for(int y = 0; y < ARRAY_Y; y++){
      if(tile[x][y] != null){
        tile[x][y].drawTile(x*SIZE_X,y*SIZE_Y);
        //rect(x*SIZE_X,y*SIZE_Y,SIZE_X,SIZE_Y);
      }
    }
  }
}
