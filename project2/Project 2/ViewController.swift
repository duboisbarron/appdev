//
//  ViewController.swift
//  Project 2
//
//  Created by Barron DuBois on 3/10/18.
//  Copyright © 2018 Barron DuBois. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    //create grocery stuff
    var groceryItemLabel: UILabel!
    var groceryInputField: UITextField!
   
    
    
    //create quantity stuff
    var quantityLabel: UILabel!
    var quantityInputField: UITextField!
    
    
    var addItem: UIButton!
    
    
    
    var groceryList: UILabel!
    
    
    
    var groceryView: UITextView!
    
    
    var groceryArray = [String]()
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // Do any additional setup after loading the view, typically from a nib.
        
        groceryItemLabel = UILabel()
        groceryItemLabel.text = "Grocery Item:"
        groceryItemLabel.font = .systemFont(ofSize: 18)
        groceryItemLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        groceryInputField = UITextField()
        groceryInputField.textColor = .white
        groceryInputField.delegate = self //later
        groceryInputField.returnKeyType = .done
        groceryInputField.attributedPlaceholder = NSAttributedString(string: "Enter groceries...", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        groceryInputField.layer.cornerRadius = 10
        groceryInputField.backgroundColor = UIColor(red: 50/255, green: 70/255, blue: 254/255, alpha: 1.0)
        groceryInputField.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        
        quantityLabel = UILabel()
        quantityLabel.text = "Quantity:"
        quantityLabel.font = .systemFont(ofSize: 18)
        quantityLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        
        
        quantityInputField = UITextField()
        quantityInputField.textColor = .white
        quantityInputField.delegate = self //later
        quantityInputField.returnKeyType = .done
        quantityInputField.attributedPlaceholder = NSAttributedString(string: "Enter quantity here...", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        quantityInputField.layer.cornerRadius = 10
        quantityInputField.backgroundColor = UIColor(red: 50/255, green: 70/255, blue: 254/255, alpha: 1.0)
        quantityInputField.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        
        
        addItem = UIButton()
        addItem.setTitle("Add Item", for: .normal)
        addItem.backgroundColor = UIColor(red: 50/255, green: 70/255, blue: 254/255, alpha: 1.0)
        addItem.setTitleColor(.white, for: .normal)
        addItem.layer.cornerRadius = 10
        addItem.addTarget(self, action: #selector(submitButtonPressed), for: .touchUpInside) //later
        addItem.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        
        groceryList = UILabel()
        groceryList.text = "Grocery List:"
        groceryList.font = .systemFont(ofSize: 18)
        groceryList.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        groceryView = UITextView()
        groceryView.delegate = self //later
        groceryView.text = printGroceryList(groceryarray: groceryArray)
        groceryView.isEditable = false
        groceryView.backgroundColor = UIColor(red: 50/255, green: 70/255, blue: 254/255, alpha: 1.0)
        groceryView.layer.cornerRadius = 10
        groceryView.textColor = .white
        groceryView.returnKeyType = .done
        groceryView.font = UIFont.systemFont(ofSize: 18)
        groceryView.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        
        view.addSubview(groceryItemLabel)
        view.addSubview(groceryInputField)
        view.addSubview(quantityLabel)
        view.addSubview(quantityInputField)
        view.addSubview(addItem)
        view.addSubview(groceryList)
        view.addSubview(groceryView)
        
        
        setupConstraints()
        
    }
    
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            groceryItemLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            groceryItemLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16)
            ])
        
        NSLayoutConstraint.activate([
           
            groceryInputField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            groceryInputField.centerYAnchor.constraint(equalTo: groceryItemLabel.centerYAnchor),
            groceryInputField.heightAnchor.constraint(equalToConstant: 20)
            ])
        
        NSLayoutConstraint.activate([
            quantityLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            quantityLabel.topAnchor.constraint(equalTo: groceryItemLabel.bottomAnchor, constant: 16)
            ])
        
        
        NSLayoutConstraint.activate([
            quantityInputField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            quantityInputField.centerYAnchor.constraint(equalTo: quantityLabel.centerYAnchor),
            quantityInputField.heightAnchor.constraint(equalToConstant: 20)
            ])
        
        NSLayoutConstraint.activate([
            addItem.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 64),
            addItem.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -64),
            addItem.heightAnchor.constraint(equalToConstant: 30),
            addItem.topAnchor.constraint(equalTo: quantityLabel.bottomAnchor, constant: 16)
           // addItem.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16)
            ])
        
        
        NSLayoutConstraint.activate([
            groceryList.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 64),
            groceryList.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -64),
            groceryList.heightAnchor.constraint(equalToConstant: 30),
            groceryList.topAnchor.constraint(equalTo: addItem.bottomAnchor, constant: 64)
            // addItem.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16)
            ])
        
        
        NSLayoutConstraint.activate([
            groceryView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 64),
            groceryView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -64),
            groceryView.topAnchor.constraint(equalTo: groceryList.bottomAnchor, constant: 8),
            groceryView.heightAnchor.constraint(equalToConstant: 200)
            ])
        
        
        
        
    }
    
    
    func printGroceryList(groceryarray : [String]) -> String {
        var stringReturned: String = ""
        for item in groceryarray {
            stringReturned.append(item)

        }

        return stringReturned

    }

    
    
    @objc func submitButtonPressed(sender: UIButton) {
        if let groceryitem = groceryInputField.text, groceryitem != "", let quantity = quantityInputField.text, quantity != "" {
            groceryArray.append("Item: \(groceryitem), Quantity: \(quantity) ")
            groceryView.text = printGroceryList(groceryarray: groceryArray)
        } else {
            print("user did not enter nickname!")
        }
    }
    
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
extension ViewController: UITextFieldDelegate, UITextViewDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        groceryInputField.endEditing(true)
        quantityInputField.endEditing(true)
        return true
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if (text == "\n") {
            //bioTextView.resignFirstResponder()
            return false
        }
        return true
    }
}

