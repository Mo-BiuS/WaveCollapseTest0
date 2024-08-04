void reset(){
  for(int x = 0; x < ARRAY_X; x++){
    for(int y = 0; y < ARRAY_Y; y++){
      tile[x][y] = null;
    }
  }
}

boolean[][] waveMap = new boolean[ARRAY_X][ARRAY_Y];

void resetWave(){
  for(int x = 0; x < ARRAY_X; x++){
    for(int y = 0; y < ARRAY_Y; y++){
      waveMap[x][y] = false;
    }
  }
}

boolean waveCollapse(int x, int y){
  if(tile[x][y] == null){
    int matchNorth = -1, matchEast = -1, matchSouth = -1, matchWest = -1;
    ArrayList<Tile> validTile = new ArrayList<>(tileList);
    ArrayList<Boolean> validTileBool = new ArrayList<>();
    
    if(x-1 >= 0 && tile[x-1][y] != null)matchWest = tile[x-1][y].tag_east;
    if(y+1 < ARRAY_Y && tile[x][y+1] != null)matchSouth = tile[x][y+1].tag_north;
    if(x+1 < ARRAY_X && tile[x+1][y] != null)matchEast = tile[x+1][y].tag_west;
    if(y-1 >= 0 && tile[x][y-1] != null)matchNorth= tile[x][y-1].tag_south;
    
    for(int i = 0; i < validTile.size(); i++)validTileBool.add(false);
    
    for(int i = 0; i < validTile.size(); i++){
      if(matchNorth != -1 && validTile.get(i).tag_north != matchNorth)validTileBool.set(i, true);
      if(matchEast  != -1 && validTile.get(i).tag_east  != matchEast )validTileBool.set(i, true);
      if(matchSouth != -1 && validTile.get(i).tag_south != matchSouth)validTileBool.set(i, true);
      if(matchWest  != -1 && validTile.get(i).tag_west  != matchWest )validTileBool.set(i, true);
    }
    
    for(int i = validTile.size()-1; i >= 0; i--){
      if(validTileBool.get(i))validTile.remove(i);
    }
    
    if(validTile.size() > 0){
      var weights = 0;
      for(int i = 0; i < validTile.size(); i++){
        weights += validTile.get(i).weight;
      }
      int value = int(random(0,weights));
      int i = 0;
      while(value-validTile.get(0).weight > 0){
        value-=validTile.get(0).weight;
        validTile.remove(0);
      }
      tile[x][y] = validTile.get(0);
      if(validTile.get(0).getClass() != (new Plain()).getClass()){
        startX = x;
        startY = y;
      }
      return true;
    }
    else{
      return false;
    }
  }else{
    waveMap[x][y] = true;
    IntList directions = new IntList();
    directions.append(0);
    directions.append(1);
    directions.append(2);
    directions.append(3);
    directions.shuffle();
    boolean gen = false;
    while(directions.size() > 0 && !gen){
      switch(directions.get(0)){
        case 0:
        if(x-1 >= 0 && !waveMap[x-1][y])gen = waveCollapse(x-1,y);
        break;
        case 1:
        if(x+1 < ARRAY_X && !waveMap[x+1][y])gen = waveCollapse(x+1,y);
        break;
        case 2:
        if(y-1 >= 0 && !waveMap[x][y-1])gen = waveCollapse(x,y-1);
        break;
        case 3:
        if(y+1 < ARRAY_Y && !waveMap[x][y+1])gen = waveCollapse(x,y+1);
        break;
      }
      directions.remove(0);
    }
    return gen;
  }
}
