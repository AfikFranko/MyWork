public class MovingCircles 
{
        public static void main(String[] args){
        
            int NumOfBalls = Integer.parseInt(args[0]);
            
            String []colorName = new String [NumOfBalls]; 
            double []rx = new double[NumOfBalls];
            double []ry = new double[NumOfBalls];
            double []vx = new double[NumOfBalls];
            double []vy = new double[NumOfBalls];
            double  sz = 0.05;
            // set the color to the arr 
            for(int i = 0 ; i < NumOfBalls ; i++)
            {
                colorName[i]= args[i+1];
            }
            // the scale of the board
            StdDraw.setXscale(-1.0, +1.0);
            StdDraw.setYscale(-1.0, +1.0);
            // loop to set speed of the ball and the place in the board
            for(int i = 0 ; i < NumOfBalls ; i ++)
            {
                rx[i]=Math.random();
                ry[i]=Math.random();
                vx[i]=Math.random()/50;
                vy[i]=Math.random()/50; 
            }
            //loop to the balls
            while(true)
            {
                // set the scale and the color of the board
                StdDraw.setPenColor(StdDraw.GRAY);
                StdDraw.filledSquare(0, 0,1.1);
                //loop for check if the touch the sides of the screen 
                for(int i = 0 ; i < NumOfBalls ; i ++)
                {
                    if (Math.abs(rx[i] + vx[i]) + sz > 1.0) 
                    {vx[i] = -vx[i];} 
                    if (Math.abs(ry[i] + vy[i]) + sz > 1.0)
                    {vy[i] = -vy[i];}
                    rx[i] = rx[i] + vx[i];
                    ry[i] = ry[i] + vy[i];
                        // loop to check if the balls touch each other 
                        for(int j = 0 ; j <NumOfBalls  ;j++)
                        {
                            double distance = Math.sqrt(Math.pow(rx[j]-rx[i],2)+Math.pow(ry[j]-ry[i],2));
                            if(distance <= (sz*2))
                            {
                                
                                vx[i] = -vx[i];
                                vy[i] = -vy[i];
                                vx[j] = -vx[j];
                                vy[j] = -vy[j];
                            }
                            rx[i] = rx[i]+vx[i];
                            ry[i] = ry[i]+vy[i];
                        }
                    GetColor(colorName[i]); 
                    StdDraw.filledCircle(rx[i], ry[i], sz);
                    
                }
                StdDraw.show(20);
            }       
        }
        
        // method the set the color name with the array / 
    public static void GetColor(String color){
        
        switch (color){
            case "BLACK":
                StdDraw.setPenColor(StdDraw.BLACK);
                break;
            case "BLUE":
                StdDraw.setPenColor(StdDraw.BLUE);                
                break;
            case "CYAN":
                StdDraw.setPenColor(StdDraw.CYAN);
                break; 
            case "DARK_GRAY":
                StdDraw.setPenColor(StdDraw.DARK_GRAY);
                break;
            case "GRAY":
                StdDraw.setPenColor(StdDraw.GRAY);
                break;
            case "GREEN":
                StdDraw.setPenColor(StdDraw.GREEN);
                break;
            case "LIGHT_GRAY":
                StdDraw.setPenColor(StdDraw.LIGHT_GRAY);
                break;
            case "MAGENTA":
                StdDraw.setPenColor(StdDraw.MAGENTA);
                break;
            case "ORANGE":
                StdDraw.setPenColor(StdDraw.ORANGE);
                break;
            case "PINK":
                StdDraw.setPenColor(StdDraw.PINK);
                break;
            case "RED":
                StdDraw.setPenColor(StdDraw.RED);
                break;
            case "WHITE":
                StdDraw.setPenColor(StdDraw.WHITE);
                break;
            case "YELLOW":
                StdDraw.setPenColor(StdDraw.YELLOW);
                break;    
            }
    }
}