// 312542822 afik franko 
// main progrem 
public class PointXYZ extends PointXY 
{
    private double z ;

    public PointXYZ()// Default constructor

    {
        super();
        this.z = 0.0;
    }
    public PointXYZ(double x, double y , double z , boolean isCartesian)// main constructor
    {
        super(x,y,isCartesian);// take the variables from the superclass
        if(isCartesian==false)
        {
            this.z=super.getR()*Math.cos(super.getTheta());// set Z
            this.x=super.getR()*Math.sin(super.getTheta())*Math.cos(getPhi());//set x
            this.y=super.getR()*Math.sin(super.getTheta())*Math.sin(getPhi());//set y
        }
        else
        this.x=Math.sqrt(Math.pow(x,2)+Math.pow(y,2));//if the point is caresian change to raduis
		this.y=Math.toRadians(Math.atan(y/x));
		this.z=z;
    }
    public double getZ()// get z 
    {
        return z;
    }
    public void setZ(double z )// set z 
    {
        this.z=z;
    }
    public double getR() // set r 
    {
        return Math.sqrt(super.getX()*super.getX()+super.getY()*super.getY()+z*z);
    }
    public  double getTheta() // get theta 
    {
     return Math.acos(z/getR());   
    }
    public double getPhi()//set phi 
    {
        return super.getY()/super.getX();
    }
    public String toString()// Print the Points  
    {
        return "(x , y , z) = "+"("+getX()+","+getY()+","+getZ()+") "+" (r,teatha,phi) = "+"("+getR()+","+getTheta()+","+getPhi()+")";
    }
    public boolean equals(PointXYZ p) // check the if the point equals
    {
        if(this.x == p.getX() && this.y == p.getY() && this.z==p.getZ())
            return true;
        else
            return false;   
    }
} 