
public class Rectangle {
  
  public String Name;
  public String ScreenName;
  
  public int x, y, width, height;

  public PImage img;
  
  public Rectangle(int x, int y, int width, int height, String ScreenName, PImage img, String Name) {
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
    this.ScreenName = ScreenName;
    this.img = img;
    this.Name = Name;
  }
  

  void display() {
    int displayWidth = this.width;
    int displayHeight = this.height;
    int displayX = this.x;
    int displayY = this.y;

    fill(255);
    textAlign(CENTER, CENTER);

    if (isHovered()) {
      textSize(40);
      tint(255, 255);
      displayWidth += 50;
      displayHeight += 50;
      displayX -= 25;
      displayY -= 25;
    } else {
      textSize(32);
      tint(255, 200);
    }
    text(this.Name, this.x + this.width / 2, this.y + this.height + 70);
    image(img, displayX, displayY, displayWidth, displayHeight);
    noTint();
  }

  boolean isClicked() {
    return mouseX > this.x && mouseX < this.x + this.width && mouseY > this.y && mouseY < this.y + this.height;
  }

  boolean isHovered() {
    return mouseX > this.x && mouseX < this.x + this.width && mouseY > this.y && mouseY < this.y + this.height;
  }
}
