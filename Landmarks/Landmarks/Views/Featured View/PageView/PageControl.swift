//
//  PageControl.swift
//  Landmarks
//
//  Created by Fohr, Jaidynn R on 3/29/23.
//

import SwiftUI
import UIKit

//Creates the 3 dot control to show the page index
//UIViewRepresentable has the same life cycle as the UIViewControllerRepresentable
struct PageControl: UIViewRepresentable {
    var numberOfPages: Int
    @Binding var currentPage: Int
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> UIPageControl {
        
        //A UIPageControl is one of the little dots for the index
        let control = UIPageControl()
        control.numberOfPages = numberOfPages
        
        //coordinator is the target of the value changed event
        control.addTarget(
            context.coordinator,
            action: #selector(
                //specify this method as the action to perform
                Coordinator.updateCurrentPage(sender:)
            ),
            for: .valueChanged)
        
        return control
    }
    
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPage
    }
    
    //This is a nested Coordinator type
    class Coordinator: NSObject {
        var control: PageControl
        
        init(_ control: PageControl) {
            self.control = control
        }
        
        //Subclasses use the target-action pattern instead of delegation, so the @objc method updates the currentPage binding
        //This pattern means an object holds info necessary to send a message to another object when an event occurs
        @objc
        func updateCurrentPage(sender: UIPageControl) {
            control.currentPage = sender.currentPage
        }
    }
}
