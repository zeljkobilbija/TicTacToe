import UIKit

class ViewController: UIViewController {
    
    var activePlayer = 1 // iks
    var gameState = [0,0,0,0,0,0,0,0,0]
    let winningCombination = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    var gameIsActive = true
    var igraJeGotova = 0
    
    @IBAction func klik(_ sender: UIButton)
    {
        if (gameState[sender.tag - 1] == 0 && gameIsActive == true && igraJeGotova == 0)
        {
            gameState[sender.tag - 1] = activePlayer
            
            if (activePlayer == 1) {
                sender.setImage(UIImage(named: "x.png"), for: UIControlState())
                activePlayer = 2
            } else {
                
                sender.setImage(UIImage(named: "o.png"), for: UIControlState())
                activePlayer = 1
            }
            
        }
        for combination in winningCombination
        {
            
            if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] 
            {
                gameIsActive = false;
                if gameState[combination[0]] == 1
                {
                    // Iks je pobednik
                    label.text = "X je pobedio"
                    igraJeGotova = 1
                }
                else
                {
                    // Oks je popbednika
                    label.text = "O je pobedio"
                    igraJeGotova = 1
                }
                playAgain.isHidden =  false
                label.isHidden     =  false
            }
        }
        gameIsActive = false
        
        for i in gameState
        {
            if i == 0 {
                gameIsActive = true
                break
            }
        }
        
        if gameIsActive == false && igraJeGotova == 0
        {
            label.text = "Nerešeno"
            label.isHidden = false
            playAgain.isHidden = false
        }
    }
    
    /**************
**************************
 **********************/
    
    @IBOutlet var label: UILabel!
    @IBOutlet var playAgain: UIButton!
    
    @IBAction func playAgain(_ sender: UIButton)
    {
        gameState =  [0,0,0,0,0,0,0,0,0]
        gameIsActive = true
        activePlayer = 1
        igraJeGotova = 0
        
        playAgain.isHidden = true
        label.isHidden = true
        
        for i in 1...9
        {
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControlState())
        }
    }
    override func viewDidLoad(){
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

