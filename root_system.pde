/*
Root system visualization
 -------------------------
 Matthijs van Mierlo
 2/19/2022
 */

color backgroundcolor = #FFEEC9;

void setup()
{
  size(1125, 750);
  smooth(4);
  noLoop();
}

void drawRoots(float startX, float startY, float angle, int iter)
{
  int maxiters = 12;
  if (iter < maxiters)
  {
    // Draw a line at + anglechange and - anglechange from reference
    float linelength  = map(iter, 1, maxiters, 100, 10);
    float angledivisor = map(mouseX, 0, width, 12, 6);
    float anglechange = PI / angledivisor;

    // Change type of stroke depending on iteration
    // Sooner iteration
    float stopchance = map(iter, 1, maxiters, 0.1, 0.3);
    if (random(1) > stopchance)
    {
      float randomchange = random(PI / 12) - PI / 24;
      float newX = startX + linelength * cos(angle + anglechange + randomchange);
      float newY = startY + linelength * sin(angle + anglechange + randomchange);
      float weight = map(iter, 1, maxiters, 7, 2);
      strokeWeight(weight);
      line(startX, startY, newX, newY);
      drawRoots(newX, newY, angle + anglechange + randomchange, iter + 1);
    }
    if (random(1) > stopchance)
    {
      float randomchange = random(PI / 12) - PI / 24;
      float newX = startX + linelength * cos(angle - anglechange + randomchange);
      float newY = startY + linelength * sin(angle - anglechange + randomchange);
      float weight = map(iter, 1, maxiters, 7, 2);
      strokeWeight(weight);
      line(startX, startY, newX, newY);
      drawRoots(newX, newY, angle - anglechange + randomchange, iter + 1);
    }
  }
}

void keyPressed()
{
  background(backgroundcolor);
  redraw();
}

void mousePressed()
{
 saveFrame("roots.png"); 
}

void draw()
{
  background(backgroundcolor);
  stroke(#5E819D, 255);
  fill(#5E819D, 255);
  drawRoots(0, height, -PI/4, 1);
  stroke(#5E689D, 255);
  fill(#5E689D, 255);
  drawRoots(width, 0, -5*PI/4, 1);
}
