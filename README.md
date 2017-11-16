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
