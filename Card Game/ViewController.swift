//
//  ViewController.swift
//  Card Game
//
//  Created by Yiwei Chen on 9/30/20.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var playerOneCardOne: UIImageView!
  @IBOutlet weak var playerOneCardTwo: UIImageView!
  @IBOutlet weak var playerOneCardThree: UIImageView!
  @IBOutlet weak var playerTwoCardOne: UIImageView!
  @IBOutlet weak var playerTwoCardTwo: UIImageView!
  @IBOutlet weak var playerTwoCardThree: UIImageView!
  @IBOutlet weak var labelResult: UILabel!
  
  var player1 = Set<String>()
  var player2 = Set<String>()
  
  
  let cardIndex = ["AC", "AD", "AH", "AS", "2C", "2D", "2H", "2S", "3C", "3D", "3H", "3S", "4C", "4D", "4H", "4S", "5C", "5D", "5H", "5S", "6C", "6D", "6H", "6S", "7C", "7D", "7H", "7S", "8C", "8D", "8H", "8S", "9C", "9D", "9H", "9S", "10C", "10D", "10H", "10S", "JC", "JD", "JH", "JS", "QC", "QD", "QH", "QS", "KC", "KD", "KH", "KS"]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }
  
  @IBAction func playGameButtonPressed(_ sender: UIButton) {
    reset()
    getCard()
    setCard()
    if(findWinner()) {
      print("winner")
      let alert = UIAlertController(title: "Play again", message: "Do you wanna play again?", preferredStyle: .alert)
      alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: {action in
        self.reset()
      }))
      alert.addAction(UIAlertAction(title: "No", style: .cancel))
      self.present(alert, animated: true)
    } else {
      labelResult.text = "No Winner!"
    }
  }
  
  func findWinner() -> Bool {
    var result: Bool = false
    if player1.contains("AS") {
      labelResult.text = "Player 1 win"
      result = true
    } else if player2.contains("AS") {
      labelResult.text = "Player 2 win"
      result = true
    }
    return result
  }
  
  func reset() {
    let p1arr = [playerOneCardOne, playerOneCardTwo, playerOneCardThree]
    let p2arr = [playerTwoCardOne, playerTwoCardTwo, playerTwoCardThree]
    
    player1.removeAll();
    player2.removeAll();
    
    var index = 0
    while index < 3 {
      p1arr[index]?.image = UIImage(named: "green_back")
      index += 1
    }
    index = 0
    while index < 3 {
      p2arr[index]?.image = UIImage(named: "red_back")
      index += 1
    }
  }
  
  func setCard() {
    let p1arr = [playerOneCardOne, playerOneCardTwo, playerOneCardThree]
    let p2arr = [playerTwoCardOne, playerTwoCardTwo, playerTwoCardThree]
    var index = 0
    for idx in player1 {
      p1arr[index]?.image = UIImage(named: idx)
      index += 1
    }
    index = 0
    for idx in player2 {
      p2arr[index]?.image = UIImage(named: idx)
      index += 1
    }
  }
  
  func getCard() {
    while player1.count < 3 {
      let num = Int.random(in: 0...51);
      player1.insert(cardIndex[num]);
    }
    while player2.count < 3 {
      let num = Int.random(in: 0...51);
      player2.insert(cardIndex[num]);
    }
  }
}

