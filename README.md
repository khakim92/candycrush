# candycrush
package CandyCrush;

import java.awt.BorderLayout;
import javax.swing.JFrame;
import javax.swing.JLabel;

public class CandyCrush extends JFrame
{
    JLabel statusbar;
    
    public CandyCrush()
    {
        statusbar = new JLabel(" 0");
        add(statusbar, BorderLayout.SOUTH);
        Board gameBoard = new Board(this);
        add(gameBoard);
        gameBoard.start();

        setSize(300, 500);
        setTitle("Candy Crush");
        setDefaultCloseOperation(EXIT_ON_CLOSE);
   }

   public JLabel getStatusBar()
   {
       return statusbar;
   }

    public static void main(String[] args)
    {
        CandyCrush newGame = new CandyCrush();
        newGame.setLocationRelativeTo(null);
        newGame.setVisible(true);
        newGame.setAlwaysOnTop(true);
        newGame.setResizable(false);

    }
}
package CandyCrush;

import java.util.Random;
import java.lang.Math;


public class Shape
{
    enum Balls { nStripes, rStripes, bStripes, gStripes, yStripes,
               pStripes, wStripes, oStripes };

    private Balls bShape;
    private int coords[][];
    private int[][][] coordsTable;


    public Shape()
    {
        coords = new int[4][2];
        setShape(Balls.nStripes);
    }

    public void setShape(Balls color)
    {
         coordsTable = new int[][][] {
            { { 0, 0 },   { 0, 0 },   { 0, 0 },   { 0, 0 } },
            { { 0, -1 },  { 0, 0 },   { -1, 0 },  { -1, 1 } },
            { { 0, -1 },  { 0, 0 },   { 1, 0 },   { 1, 1 } },
            { { 0, -1 },  { 0, 0 },   { 0, 1 },   { 0, 2 } },
            { { -1, 0 },  { 0, 0 },   { 1, 0 },   { 0, 1 } },
            { { 0, 0 },   { 1, 0 },   { 0, 1 },   { 1, 1 } },
            { { -1, -1 }, { 0, -1 },  { 0, 0 },   { 0, 1 } },
            { { 1, -1 },  { 0, -1 },  { 0, 0 },   { 0, 1 } }
        };

        for (int i = 0; i < 4 ; i++)
        {
            for (int j = 0; j < 2; ++j)
            {
                coords[i][j] = coordsTable[color.ordinal()][i][j];
            }
        }
        bShape = color;
    }

    private void setX(int index, int x)
    {
    	coords[index][0] = x;
    }
    
    private void setY(int index, int y)
    {
    	coords[index][1] = y;
    }
    
    public int x(int index)
    {
    	return coords[index][0];
    }
    
    public int y(int index)
    {
    	return coords[index][1];
    }
    
    public Balls getShape()
    {
    	return bShape;
    }

    public void setRandomShape()
    {
        Random rand = new Random();
        int x = Math.abs(rand.nextInt()) % 7 + 1;
        Balls[] values = Balls.values(); 
        setShape(values[x]);
    }

    public int minX()
    {
      int m = coords[0][0];
      for (int i=0; i < 4; i++)
      {
          m = Math.min(m, coords[i][0]);
      }
      return m;
    }


    public int minY() 
    {
      int m = coords[0][1];
      for (int i=0; i < 4; i++)
      {
          m = Math.min(m, coords[i][1]);
      }
      return m;
    }
}


