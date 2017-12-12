# candycrush
package CandyCrush;

import java.awt.Color;
import java.awt.Dimension;
import java.awt.Graphics;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.Timer;
import CandyCrush.Shape.Balls;

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

    
     public void actionPerformed(ActionEvent e) {
        if (isFallingFinished) {
            isFallingFinished = false;
            newPiece();
        } else {
            oneLineDown();
        }
    }
    int squareWidth() { return (int) getSize().getWidth() / BoardWidth; }
    int squareHeight() { return (int) getSize().getHeight() / BoardHeight; }
    Balls shapeAt(int x, int y) { return board[(y * BoardWidth) + x]; }

}


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
     private void newPiece()
    {
        curPiece.setRandomShape();
        curX = BoardWidth / 2 + 1;
        curY = BoardHeight - 1 + curPiece.minY();
        if (!tryMove(curPiece, curX, curY)) {
            curPiece.setShape(Balls.nStripes);
            timer.stop();
            isStarted = false;
            statusbar.setText("game over");
        }
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


