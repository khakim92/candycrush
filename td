         class TAdapter extends KeyAdapter {

        public void keyPressed(KeyEvent e) {

 

            if (!isStarted || curPiece.getShape() == Balls.nStripes) { 

                return;

            }
 

            int keycode = e.getKeyCode();

            if (keycode == 'p' || keycode == 'P') {

                pause();
                return;
            }
 
            if (isPaused)
                return;
             switch (keycode) {

            case KeyEvent.VK_LEFT:

                tryMove(curPiece, curX - 1, curY);

                break;

            case KeyEvent.VK_RIGHT:
                tryMove(curPiece, curX + 1, curY);
                break;


            case KeyEvent.VK_SPACE:
                dropDown();
                break;
            case 'd':
                oneLineDown();
                break;
            case 'D':
                oneLineDown();
                break;
            }

        }
    }
}
