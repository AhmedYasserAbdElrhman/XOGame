//
//  ViewController.swift
//  XOGame
//
//  Created by Ahmed Yasser on 7/10/19.
//  Copyright © 2019 Ahmed Yasser. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var winLabel :UILabel!
    var activePlayer = 1 //For X
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    var winningState = [[0,1,2],[0,3,6],[0,4,8],[1,4,7],[2,5,8],[2,4,6],[3,4,5],[6,7,8]]
    var isActive = true
    @IBAction func restartGame (_ sender: AnyObject){
        activePlayer = 1 //For X
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        isActive = true
        winLabel.isHidden = true
        for i in 1...9{
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControl.State())
        }
        
    }
    @IBAction func action(_ sender: AnyObject) {
        if (gameState[sender.tag - 1] == 0 && isActive == true){
            gameState[sender.tag-1] = activePlayer
            if activePlayer == 1{
                sender.setImage(UIImage(named: "X.jpeg"), for: UIControl.State())
                activePlayer = 2
            }
            else  {
                sender.setImage(UIImage(named: "O.jpeg"), for: UIControl.State())
                activePlayer = 1
                
            }

        }
        for x in winningState {
            if gameState[x[0]] != 0 && gameState[x[0]] == gameState[x[1]] && gameState[x[1]] == gameState[x[2]]{
                isActive = false
                if gameState[x[0]] == 1 // X Wins
                {
                    winLabel.isHidden = false
                    winLabel.text = "X Wins"
                }
                else {
                    winLabel.isHidden = false
                    winLabel.text = "O Wins"
                }
            }
        }
        isActive = false
        for i in gameState{
            if i == 0 && winLabel.isHidden == true{
                isActive = true
                break
            }
        }
        if isActive == false && winLabel.isHidden == true{
            winLabel.isHidden = false
            winLabel.text = "Draw"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

