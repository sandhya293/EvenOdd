//
//  ViewController.swift
//  EvenOdd
//
//  Created by Sandhya Baghel on 19/06/21.
//  Copyright © 2021 Sandhya. All rights reserved.
//

import UIKit

extension UIViewController {

func showToast(message : String, font: UIFont) {

    let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-100, width: 150, height: 35))
    toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
    toastLabel.textColor = UIColor.white
    toastLabel.font = font
    toastLabel.textAlignment = .center;
    toastLabel.text = message
    toastLabel.alpha = 1.0
    toastLabel.layer.cornerRadius = 10;
    toastLabel.clipsToBounds  =  true
    self.view.addSubview(toastLabel)
    UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
         toastLabel.alpha = 0.0
    }, completion: {(isCompleted) in
        toastLabel.removeFromSuperview()
    })
} }


class ViewController: UIViewController {
    private  let btn:UIButton = {
        let button = UIButton()
        button.setTitle("Check", for: .normal)
        button.addTarget(self, action: #selector(check), for: .touchUpInside)
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = 6
        return button
    }()
    private let txt:UITextField = {
        let text = UITextField()
        text.placeholder = "enter value"
        text.borderStyle = .roundedRect
    
        return text
           }()
    @objc private func check()
       {
        let vc = result()
         txt.resignFirstResponder()
        if let n =  Int(txt.text ?? "0")
        {
            if(n % 2 == 0)
                      {
                         
                           self.showToast(message: "value is even", font: .systemFont(ofSize: 12.0))
                            vc.text = "VALUE YOU HAVE ENTERED IS EVEN"
                    }
                      else
                      {
                          self.showToast(message: "VALUE IS ODD", font: .systemFont(ofSize: 12.0))
                          vc.text = "VALUE YOU HAVE ENTERED IS ODD"
                      }
            navigationController?.pushViewController(vc, animated: true)
        }
            else {
                let alert = UIAlertController(title: "Oops!", message: "Wrong input. Please enter a number", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel))
                DispatchQueue.main.async {
                    self.present(alert, animated: true, completion: nil)
                }
            
                return
                
        }
        
          
        }
       
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(btn)
        view.addSubview(txt)
    }
   
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        btn.frame = CGRect(x: 120 , y: 480 , width: 160 , height : 50)
        txt.frame = CGRect(x: 120 , y: 400 , width: 160 , height : 50)
    }

   
    
    
}

