//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Amanda Fernandes on 21/03/2017.
//  Copyright © 2017 Amanda Fernandes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // 1 is noughts and 2 is cross
    @IBOutlet weak var winnerLine: UIImageView!
    @IBOutlet weak var resetBtn: UIButton!
    var activePlayer = 1
    var numberOfPlays = 0
    var hasWinner = false
    var gameState = [0, 0 ,0 ,0 ,0 ,0 ,0 ,0, 0]
    let winningPositions = [[0, 1, 2], [3, 4, 5], [6, 7, 8],
                            [0, 3, 6], [1, 4, 7], [2, 5, 8],
                            [0, 4, 8], [2, 4, 6]]
    
    
    @IBAction func tappedBtn(_ sender: AnyObject) {
        let gamePosition = (sender as AnyObject).tag - 1
        let maxPlays = 9
        
        if gameState[gamePosition] == 0 && !hasWinner {
            gameState[gamePosition] = activePlayer
            
            if activePlayer == 1 {
                (sender as AnyObject).setImage(UIImage(named: "nought.png"), for: [])
                activePlayer = 2
                numberOfPlays += 1
                
            } else if activePlayer == 2 {
                (sender as AnyObject).setImage(UIImage(named: "cross.png"), for: [])
                activePlayer = 1
                numberOfPlays += 1
            }
            print(numberOfPlays)
            checkForWin()
        }
        
        if numberOfPlays == maxPlays {
            resetBtn.isEnabled = true
        }
    }
    
    func checkForWin() {
        var state = 0
        
        for (index, value) in winningPositions.enumerated() {
            if gameState[value[0]] != 0 &&
                gameState[value[0]] == gameState[value[1]] &&
                gameState[value[1]] == gameState[value[2]] {
                
                hasWinner = true
                state = index
                break
            }
        }
        
        if hasWinner {
            let image = "line\(state).png"
            winnerLine.image = UIImage(named: image)
            
            resetBtn.isEnabled = true
        }
    }
    
    @IBAction func resetGame(_ sender: Any) {
        activePlayer = 1
        numberOfPlays = 0
        hasWinner = false
        gameState = [0, 0 ,0 ,0 ,0 ,0 ,0 ,0, 0]
        resetBtn.isEnabled = false
        
        for number in 1..<10 {
            if let button = view.viewWithTag(number) as? UIButton {
                button.setImage(nil, for: [])
            }
        }
        winnerLine.image = nil
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

