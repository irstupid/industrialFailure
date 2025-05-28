class Battle
{
  Pokemon[] player = new Pokemon[4];
  Pokemon[] opponent = new Pokemon[4];
  
  int state;
  
  int menu;
  int select;
  
  int mainToSwitch;
  int mainToBattle;
  int mainToItem;
  
  Battle(Trainer trainer, Pokemon[] pokemon)
  {
    player = pokemon;
  }
  
  Battle()
  {
    player[0] = new Pokemon();
    opponent[0] = new Pokemon();
  }
  
  void draw()
  {
    push();
      push();
        background(#dddddd);
        fill(#bbbbcc);
        ellipse(width/4 * 3, height/4, width/2.5, height/6);
        ellipse(width/4, height/4 * 2.75, width/1.5, height/4);
      pop();
      push();
        translate(width/4 * 3, height/4);
        opponent[0].drawFront();
      pop();
      push();
        translate(width/4, height/4 * 2.75);
        player[0].drawBack();
      pop();
      push();
        if(menu == 0 && mainToSwitch > 0)
        {
          mainToSwitch -= 10;
        }
        else if(menu == 3 && mainToSwitch < 255)
        {
          mainToSwitch += 10;
        }
        mainToSwitch = constrain(mainToSwitch, 0, 255);
        if(select == 0) { fill(#00ff00); } else { fill(#ffffff); }
        rect(0, height - 200, width/2, 100);
        if(select == 2) { fill(#00ff00); } else { fill(#ffffff); }
        rect(0, height - 100, width/2, 100);
        if(select == 1) { fill(#00ff00); } else { fill(#ffffff); }
        rect(width/2, height - 200, width/2, 100);
        if(select == 3) { fill(#00ff00); } else { fill(#ffffff); }
        rect(width/2, height - 100, width/2, 100);
        textSize(100);
        fill(#000000, 255 - mainToSwitch);
        text("battle", 60, height - 110);
        text("switch", 60, height - 10);
        text("item", width/2 + 100, height - 110);
        text("run", width/2 + 120, height - 10);
        fill(#000000, mainToSwitch);
        text("a", 60, height - 110);
        text("b", 60, height - 10);
        text("c", width/2 + 100, height - 110);
        text("d", width/2 + 120, height - 10);
        fill(#ffffff);
        circle(width/2, height - 100, 100);
        translate(width/2, height - 100);
        rotate((mainToSwitch / 255f) * PI/2);
        noStroke();
        fill(#ff0000, mainToSwitch);
        rectMode(CENTER);
        rect(0, 0, 65, 65);  
        fill(#ff0000, 255 - mainToSwitch);
        rotate(-0.3);
        star(0, 0, 20, 40, 5);
      pop();
      push();
        if(menu == 1 && mainToBattle < 300)
        {
          mainToBattle += 10;
        }
        if(menu == 0 && mainToBattle > 0)
        {
          mainToBattle -= 10;
        }
        mainToBattle = constrain(mainToBattle, 0, 300);
        textSize(50);
        push();
          translate(min(mainToBattle, 100) * width/200 - width/2, height - 200);
          if(select == 0) { fill(#00ff00); } else { fill(#ffffff); }
          rect(0, 0, width/2, 200/3);
          fill(#000000);
          text("peepeepoopoo", 0, 50);
        pop();
        push();
          translate(min(mainToBattle - 100, 100) * width/200 - width/2, height - 200 + 200/3);
          if(select == 2) { fill(#00ff00); } else { fill(#ffffff); }
          rect(0, 0, width/2, 200/3);
          fill(#000000);
          text("peepeepoopoo", 0, 50);
        pop();
        push();
          translate(min(mainToBattle - 200, 100) * width/200 - width/2, height - 200 + 200/3 + 200/3);
          if(select == 4) { fill(#00ff00); } else { fill(#ffffff); }
          rect(0, 0, width/2, 200/3);
          fill(#000000);
          text("peepeepoopoo", 0, 50);
        pop();
        push();
          translate(width - (min(mainToBattle, 100) * width/200), height - 200);
          if(select == 1) { fill(#00ff00); } else { fill(#ffffff); }
          rect(0, 0, width/2, 200/3);
          fill(#000000);
          text("peepeepoopoo", 0, 50);
        pop();
        push();
          translate(width - (min(mainToBattle - 100, 100) * width/200), height - 200 + 200/3);
          if(select == 3) { fill(#00ff00); } else { fill(#ffffff); }
          rect(0, 0, width/2, 200/3);
          fill(#000000);
          text("instant fucking death beam", 0, 50);
        pop();
        push();
          translate(width - (min(mainToBattle - 200, 100) * width/200), height - 200 + 200/3 + 200/3);
          if(select == 5) { fill(#00ff00); } else { fill(#ffffff); }
          rect(0, 0, width/2, 200/3);
          fill(#000000);
          text("peepeepoopoo", 0, 50);
        pop();
      pop();
      push();
        translate(0, 200 - mainToItem);
        if(menu == 2 && mainToItem < 200)
        {
          mainToItem += 20;
        }
        if(menu == 0 && mainToItem > 0)
        {
          mainToItem -= 20;
        }
        
        rectMode(CENTER);
        rect(width/2, height - 100, width/2, 70);
        rect(width/2, height - 100 - 55, width/2, 40);
        rect(width/2, height - 100 - 85, width/2, 20);
        rect(width/2, height - 100 + 55, width/2, 40);
        rect(width/2, height - 100 + 85, width/2, 20);
        
        rectMode(CORNER);
        rect(width/4 * 3, height - 200, width/16, 200);
        rect(width/4 - width/16, height - 200, width/16, 200);
        quad(width/4 * 3 + width/16, height - 190, width/4 * 3 + width/16, height - 10, width/4 * 3 + width/8, height - 50, width/4 * 3 + width/8, height - 150);
        quad(width/4 - width/16, height - 190, width/4 - width/16, height - 10, width/4 - width/8, height - 50, width/4 - width/8, height - 150);
        rect(width/4 * 3 + width/8, height - 125, width - (width/4 * 3 + width/8), 50);
        rect(0, height - 125, width - (width/4 * 3 + width/8), 50);
      pop();
    pop();
  }
  
  void keyPressed()
  {
    if(key == '2')
    {
      menu = 0;
      select = 0;
    }
    switch(menu)
    {
      case 0: case 3:
        switch(key)
        {
          case 'w':
            select -= 2;
          break;
          case 'a':
            select -= 1;
          break;
          case 's':
            select += 2;
          break;
          case 'd':
            select += 1;
          break;
          case '1':
            if(select == 3)
            {
              return;
            }
            else
            {
              menu = select + 1;
              select = 0;
            }
          break;
        }
        if(select < 1)
        {
          select += 4;
        }
        select = select % 4;
      break;
      case 1:
        switch(key)
        {
          case 'w':
            select -= 2;
          break;
          case 'a':
            select -= 1;
          break;
          case 's':
            select += 2;
          break;
          case 'd':
            select += 1;
          break;
          case '1':
            if(select == 3)
            {
              return;
            }
            else
            {
              menu = select + 1;
              select = 0;
            }
          break;
        }
        if(select < 1)
        {
          select += 6;
        }
        select = select % 6;
      break;
      case 2:
      
      break;
    }
  }
  
  void keyReleased()
  {
    
  }
  
  void star(float x, float y, float radius1, float radius2, int npoints) 
  {
    float angle = TWO_PI / npoints;
    float halfAngle = angle/2.0;
    beginShape();
    for (float a = 0; a < TWO_PI; a += angle) 
    {
      float sx = x + cos(a) * radius2;
      float sy = y + sin(a) * radius2;
      vertex(sx, sy);
      sx = x + cos(a+halfAngle) * radius1;
      sy = y + sin(a+halfAngle) * radius1;
      vertex(sx, sy);
    }
    endShape(CLOSE);
  }
}
