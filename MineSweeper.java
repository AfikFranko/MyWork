public class MineSweeper
{
    public static void main(String[] args) {

        int rows ;
        int col;
        double p;
        
        StdOut.println("Input how much  rows ");
        rows = StdIn.readInt();
        while (rows<=0){
            StdOut.println("Good bye ! ");
            break ;
        }   
        StdOut.println("Input how colns ");
        col = StdIn.readInt();
        while (col<=0){
            StdOut.println("Good bye ! ");
            break ;
        } 
        StdOut.println("Input the probility"); 
        p = StdIn.readDouble();
        while (p<=0 && p>=1){
            StdOut.println("Good bye ! ");
            break ;
        } 
        // part 1
        boolean [] [] arr = makeAbooleanBoard(rows,col,p);
        // part 2 
        PrintBoard(arr);
        StdOut.println();
        // part 3
        PrintBoardOfNeighbor(arr);
        // part 4
        StdOut.print("Input the index of the line (-1 to exit the function)");
		int i = StdIn.readInt();
		StdOut.print("Input the index of the row (-1 to exit the function)");
        int j = StdIn.readInt();
        while(i != -1)
        {
        printrCordinate(arr,i,j);
        StdOut.println();
        StdOut.print("Input the index of the line (-1 to exit the function)");
        i = StdIn.readInt();
        if(i==-1)
            break;
		StdOut.print("Input the index of the row (-1 to exit the function)");
        j = StdIn.readInt();
        

        }

    }
    public static boolean [] [] makeAbooleanBoard(int rows,int col,double p){
        // make the mine board 
        boolean [] [] myArr = new boolean [rows][col];
        for(int i = 0 ; i < rows ;i++)
        {
            for (int j = 0 ; j < col ;j ++)
            {
                if(Math.random()<=p)
                myArr[i][j]=true;
            }
        }
        return myArr;
    }
    public static void PrintBoard(boolean arr [][] ){
        // print the board 
        for(int i = 0 ; i < arr.length;i++){
            for(int j = 0 ;j <arr[0].length;j++){
                if (arr[i][j]==true)
                    StdOut.print(" * ");
                else 
                    StdOut.print(" . ");   
            }
            StdOut.println();
        }
    }
    public static void PrintBoardOfNeighbor(boolean arr [][]) {
        // print the neighboor board
        for (int i = 0 ; i < arr.length;i++){
            for(int j = 0 ; j < arr[0].length; j ++){
                if(arr[i][j]==true)
                    StdOut.print(" * ");
                else
                    StdOut.print(checkNeighbor(arr,i,j)+"  ");
            }
            StdOut.println();
        }
        
    }
    public static int checkNeighbor(boolean [][] arr,int i , int j) {
        // check the place near the mine 
        int count = 0 ; 
        for (int k = i-1 ; k < i +1 ; k++){
            for(int l = j -1 ; l < j+1 ; l++){
                if(k>=0 && k < arr.length && l >= 0 && l < arr[0].length && arr[k][l])
                    count ++;
                }
            }
        return count;
    }
    public static void printrCordinate(boolean arr [][],int i ,int j){
        // print part 4 
        int count = 0 ; 
            if(arr[i][j])
                StdOut.print("There is a  mine in " +"["+ i + ","+j+"]");
            else    
            for (int k = i-1 ; k < i +1 ; k++){
                for(int l = j -1 ; l < j+1 ; l++){
                    if(k>=0 && k < arr.length && l >= 0 && l < arr[0].length && arr[k][l]){
                        count ++;
                    }
                }
            }
            StdOut.println("There are " +count+ " mines around ["+ i +"," +j + "]");    
    }
}