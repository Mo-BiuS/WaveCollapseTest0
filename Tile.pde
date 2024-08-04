final int TAG_PLAIN = 0, TAG_PATH = 1;

final int PLAIN_WEIGHT = 128;
final int LINE_WEIGHT = 8;
final int END_WEIGHT = 1;
final int TURN_WEIGHT = 2;
final int CROSSING_WEIGHT = 4;

final int CASTLE_WEIGHT = 8;
final int FARM_WEIGHT = 16;

ArrayList<Tile> tileList;

void initTileList(){
  tileList = new ArrayList<Tile>();
  tileList.add(new Plain());
  
  tileList.add(new House());
  tileList.add(new Castle());
  
  tileList.add(new oneWayN());
  tileList.add(new oneWayE());
  tileList.add(new oneWayS());
  tileList.add(new oneWayW());
  
  tileList.add(new twoWayEW());
  tileList.add(new twoWayNS());
  
  tileList.add(new twoWayNE());
  tileList.add(new twoWayES());
  tileList.add(new twoWaySW());
  tileList.add(new twoWayNW());
  
  tileList.add(new threeWayNES());
  tileList.add(new threeWayESW());
  tileList.add(new threeWayNSW());
  tileList.add(new threeWayNEW());
  
  tileList.add(new fourWay());
}

class Tile{
  PImage sprite;
  int tag_north, tag_east, tag_south, tag_west;
  int weight;
  
  void drawTile(int posX, int posY){
    image(sprite,posX,posY,SIZE_X,SIZE_Y);
  }
}

//============================[BUILDING]============================
class House extends Tile{
  House(){
    weight = FARM_WEIGHT;
    tag_north = TAG_PLAIN;
    tag_east  = TAG_PLAIN;
    tag_south = TAG_PATH;
    tag_west  = TAG_PLAIN;
    sprite = loadImage("WaveTile/building_house.png");
  }
}
class Castle extends Tile{
  Castle(){
    weight = CASTLE_WEIGHT;
    tag_north = TAG_PLAIN;
    tag_east  = TAG_PLAIN;
    tag_south = TAG_PATH;
    tag_west  = TAG_PLAIN;
    sprite = loadImage("WaveTile/building_castle.png");
  }
}
//============================[0]============================
class Plain extends Tile{
  Plain(){
    weight = PLAIN_WEIGHT;
    tag_north = TAG_PLAIN;
    tag_east  = TAG_PLAIN;
    tag_south = TAG_PLAIN;
    tag_west  = TAG_PLAIN;
    sprite = loadImage("WaveTile/plain0.png");
  }
}
//============================[1]============================
class oneWayN extends Tile{
  oneWayN(){
    weight = END_WEIGHT;
    tag_north = TAG_PATH;
    tag_east  = TAG_PLAIN;
    tag_south = TAG_PLAIN;
    tag_west  = TAG_PLAIN;
    sprite = loadImage("WaveTile/1wayN.png");
  }
}
class oneWayE extends Tile{
  oneWayE(){
    weight = END_WEIGHT;
    tag_north = TAG_PLAIN;
    tag_east  = TAG_PATH;
    tag_south = TAG_PLAIN;
    tag_west  = TAG_PLAIN;
    sprite = loadImage("WaveTile/1wayE.png");
  }
}
class oneWayS extends Tile{
  oneWayS(){
    weight = END_WEIGHT;
    tag_north = TAG_PLAIN;
    tag_east  = TAG_PLAIN;
    tag_south = TAG_PATH;
    tag_west  = TAG_PLAIN;
    sprite = loadImage("WaveTile/1wayS.png");
  }
}
class oneWayW extends Tile{
  oneWayW(){
    weight = END_WEIGHT;
    tag_north = TAG_PLAIN;
    tag_east  = TAG_PLAIN;
    tag_south = TAG_PLAIN;
    tag_west  = TAG_PATH;
    sprite = loadImage("WaveTile/1wayW.png");
  }
}
//============================[2]============================
class twoWayEW extends Tile{
  twoWayEW(){
    weight = LINE_WEIGHT;
    tag_north = TAG_PLAIN;
    tag_east  = TAG_PATH;
    tag_south = TAG_PLAIN;
    tag_west  = TAG_PATH;
    sprite = loadImage("WaveTile/2wayEW.png");
  }
}
class twoWayNS extends Tile{
  twoWayNS(){
    weight = LINE_WEIGHT;
    tag_north = TAG_PATH;
    tag_east  = TAG_PLAIN;
    tag_south = TAG_PATH;
    tag_west  = TAG_PLAIN;
    sprite = loadImage("WaveTile/2wayNS.png");
  }
}
class twoWayNE extends Tile{
  twoWayNE(){
    weight = TURN_WEIGHT;
    tag_north = TAG_PATH;
    tag_east  = TAG_PATH;
    tag_south = TAG_PLAIN;
    tag_west  = TAG_PLAIN;
    sprite = loadImage("WaveTile/2wayNE.png");
  }
}
class twoWayES extends Tile{
  twoWayES(){
    weight = TURN_WEIGHT;
    tag_north = TAG_PLAIN;
    tag_east  = TAG_PATH;
    tag_south = TAG_PATH;
    tag_west  = TAG_PLAIN;
    sprite = loadImage("WaveTile/2wayES.png");
  }
}
class twoWaySW extends Tile{
  twoWaySW(){
    weight = TURN_WEIGHT;
    tag_north = TAG_PLAIN;
    tag_east  = TAG_PLAIN;
    tag_south = TAG_PATH;
    tag_west  = TAG_PATH;
    sprite = loadImage("WaveTile/2waySW.png");
  }
}
class twoWayNW extends Tile{
  twoWayNW(){
    weight = TURN_WEIGHT;
    tag_north = TAG_PATH;
    tag_east  = TAG_PLAIN;
    tag_south = TAG_PLAIN;
    tag_west  = TAG_PATH;
    sprite = loadImage("WaveTile/2wayNW.png");
  }
}
//============================[3]============================
class threeWayNES extends Tile{
  threeWayNES(){
    weight = CROSSING_WEIGHT;
    tag_north = TAG_PATH;
    tag_east  = TAG_PATH;
    tag_south = TAG_PATH;
    tag_west  = TAG_PLAIN;
    sprite = loadImage("WaveTile/3wayNES.png");
  }
}
class threeWayESW extends Tile{
  threeWayESW(){
    weight = CROSSING_WEIGHT;
    tag_north = TAG_PLAIN;
    tag_east  = TAG_PATH;
    tag_south = TAG_PATH;
    tag_west  = TAG_PATH;
    sprite = loadImage("WaveTile/3wayESW.png");
  }
}
class threeWayNSW extends Tile{
  threeWayNSW(){
    weight = CROSSING_WEIGHT;
    tag_north = TAG_PATH;
    tag_east  = TAG_PLAIN;
    tag_south = TAG_PATH;
    tag_west  = TAG_PATH;
    sprite = loadImage("WaveTile/3wayNSW.png");
  }
}
class threeWayNEW extends Tile{
  threeWayNEW(){
    weight = CROSSING_WEIGHT;
    tag_north = TAG_PATH;
    tag_east  = TAG_PATH;
    tag_south = TAG_PLAIN;
    tag_west  = TAG_PATH;
    sprite = loadImage("WaveTile/3wayNEW.png");
  }
}
//============================[4]============================
class fourWay extends Tile{
  fourWay(){
    weight = CROSSING_WEIGHT;
    tag_north = TAG_PATH;
    tag_east  = TAG_PATH;
    tag_south = TAG_PATH;
    tag_west  = TAG_PATH;
    sprite = loadImage("WaveTile/4way.png");
  }
}
