//
//  ViewController.swift
//  Scrollable-Segmented-Control-UIKit
//
//  Created by Caner Ates on 10.05.2024.
//

import UIKit

class ViewController: UIViewController, ScrollableSegmentedControlDelegate {
    
    func didButtonTapped(at index: Int) {
        print("Button at index \(index) is tapped.")
    }
    
    lazy var scrollableControl1: ScrollableSegmentedControl = {
        let control = ScrollableSegmentedControl(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 35))
        control.delegate = self
        control.translatesAutoresizingMaskIntoConstraints = false
        return control
    }()
    
    lazy var scrollableControl2: ScrollableSegmentedControl = {
        let control = ScrollableSegmentedControl(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 35))
        control.buttonTitleColor = .white
        control.buttonBackgroundColor = .clear
        control.buttonHighlightedTitleColor = .black
        control.buttonHighlightedBackgroundColor = .white
        control.buttonCornerRadius = 5
        control.buttonBorderWidth = 4
        control.delegate = self
        control.translatesAutoresizingMaskIntoConstraints = false
        return control
    }()
    
    lazy var scrollableControl3: ScrollableSegmentedControl = {
        let control = ScrollableSegmentedControl(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 35))
        control.buttonTitleColor = .white
        control.buttonBackgroundColor = .clear
        control.buttonHighlightedTitleColor = .black
        control.buttonHighlightedBackgroundColor = .white
        control.buttonHeight = 45
        control.scrollHeight = 45
        control.delegate = self
        control.translatesAutoresizingMaskIntoConstraints = false
        return control
    }()
    
    lazy var scrollableControl4: ScrollableSegmentedControl = {
        let control = ScrollableSegmentedControl(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 35))
        control.buttonTitleColor = .white
        control.buttonBackgroundColor = .clear
        control.buttonHighlightedTitleColor = .black
        control.buttonHighlightedBackgroundColor = .white
        control.delegate = self
        control.translatesAutoresizingMaskIntoConstraints = false
        return control
    }()
    
    lazy var scrollableControl5: ScrollableSegmentedControl = {
        let control = ScrollableSegmentedControl(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 35))
        control.buttonTitleColor = .white
        control.buttonBackgroundColor = .clear
        control.buttonHighlightedTitleColor = .black
        control.buttonHighlightedBackgroundColor = .white
        control.stackSpacing = 15
        control.delegate = self
        control.translatesAutoresizingMaskIntoConstraints = false
        return control
    }()
    
    lazy var scrollableControl6: ScrollableSegmentedControl = {
        let control = ScrollableSegmentedControl(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 35))
        control.buttonTitleColor = .white
        control.buttonBackgroundColor = .clear
        control.buttonHighlightedTitleColor = .black
        control.buttonHighlightedBackgroundColor = .white
        control.stackHorizontalPadding = 20
        control.delegate = self
        control.translatesAutoresizingMaskIntoConstraints = false
        return control
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        
        // Segmented Control variables can be modified before defining button titles
        // Ex.
        // scrollableControl1.stackSpacing = 10
        // scrollableControl1.stackHorizontalPadding = 10
        
        // Defining button titles of the control is required to setup, which should be last
        scrollableControl1.buttons = ["Olivia", "Livia", "Maggie", "Ivor", "Tiffany", "Savannah", "Elsa", "Linda", "Esmee", "Irene", "Ann", "Anna", "Vicky", "Lucy", "Fiona", "Claire", "Alicia"]
        
        scrollableControl2.buttons = ["Olivia", "Livia", "Maggie", "Ivor", "Tiffany", "Savannah", "Elsa", "Linda", "Esmee", "Irene", "Ann", "Anna", "Vicky", "Lucy", "Fiona", "Claire", "Alicia"]
        
        scrollableControl3.buttons = ["Olivia", "Livia", "Maggie", "Ivor", "Tiffany", "Savannah", "Elsa", "Linda", "Esmee", "Irene", "Ann", "Anna", "Vicky", "Lucy", "Fiona", "Claire", "Alicia"]
        
        scrollableControl4.buttons = ["Olivia", "Livia", "Maggie", "Ivor", "Tiffany", "Savannah", "Elsa", "Linda", "Esmee", "Irene", "Ann", "Anna", "Vicky", "Lucy", "Fiona", "Claire", "Alicia"]
        
        scrollableControl5.buttons = ["Olivia", "Livia", "Maggie", "Ivor", "Tiffany", "Savannah", "Elsa", "Linda", "Esmee", "Irene", "Ann", "Anna", "Vicky", "Lucy", "Fiona", "Claire", "Alicia"]
        
        scrollableControl6.buttons = ["Olivia", "Livia", "Maggie", "Ivor", "Tiffany", "Savannah", "Elsa", "Linda", "Esmee", "Irene", "Ann", "Anna", "Vicky", "Lucy", "Fiona", "Claire", "Alicia"]
        
        view.addSubview(scrollableControl1)
        view.addSubview(scrollableControl2)
        view.addSubview(scrollableControl3)
        view.addSubview(scrollableControl4)
        view.addSubview(scrollableControl5)
        view.addSubview(scrollableControl6)
        
        applyConstraints()
        
    }
    
    private func applyConstraints() {
        
        let scrollableControl1Constraints = [
            scrollableControl1.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            scrollableControl1.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollableControl1.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollableControl1.heightAnchor.constraint(equalToConstant: 50)
        ]
        
        let scrollableControl2Constraints = [
            scrollableControl2.topAnchor.constraint(equalTo: scrollableControl1.bottomAnchor, constant: 40),
            scrollableControl2.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollableControl2.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollableControl2.heightAnchor.constraint(equalToConstant: 50)
        ]
        
        let scrollableControl3Constraints = [
            scrollableControl3.topAnchor.constraint(equalTo: scrollableControl2.bottomAnchor, constant: 40),
            scrollableControl3.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollableControl3.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollableControl3.heightAnchor.constraint(equalToConstant: 50)
        ]
        
        let scrollableControl4Constraints = [
            scrollableControl4.topAnchor.constraint(equalTo: scrollableControl3.bottomAnchor, constant: 40),
            scrollableControl4.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollableControl4.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollableControl4.heightAnchor.constraint(equalToConstant: 50)
        ]
        
        let scrollableControl5Constraints = [
            scrollableControl5.topAnchor.constraint(equalTo: scrollableControl4.bottomAnchor, constant: 40),
            scrollableControl5.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollableControl5.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollableControl5.heightAnchor.constraint(equalToConstant: 50)
        ]
        
        let scrollableControl6Constraints = [
            scrollableControl6.topAnchor.constraint(equalTo: scrollableControl5.bottomAnchor, constant: 40),
            scrollableControl6.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollableControl6.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollableControl6.heightAnchor.constraint(equalToConstant: 50)
        ]
        
        NSLayoutConstraint.activate(scrollableControl1Constraints)
        NSLayoutConstraint.activate(scrollableControl2Constraints)
        NSLayoutConstraint.activate(scrollableControl3Constraints)
        NSLayoutConstraint.activate(scrollableControl4Constraints)
        NSLayoutConstraint.activate(scrollableControl5Constraints)
        NSLayoutConstraint.activate(scrollableControl6Constraints)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }


}

