//
//  PageViewController.swift
//  Landmarks
//
//  Created by Fohr, Jaidynn R on 3/29/23.
//

import SwiftUI
import UIKit

//Creates horizontal scrolling pages for the featured page to show how UI Kit can interface with Swift UI
struct PageViewController<Page: View>: UIViewControllerRepresentable {
    var pages: [Page]
    @Binding var currentPage: Int
    
    //Create a coordinator, more info below
    //Must be done before creating the view controller so that this can be accessed by it
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    //called once when SwiftUI is ready to display the view
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal)
        
        //sets coordinator as data source for the first two methods inside it
        pageViewController.dataSource = context.coordinator
        
        //sets coordinator as delegate to connect binding to currentPage in both directions
        //allows updates to show correct page index after each swipe
        pageViewController.delegate = context.coordinator

        return pageViewController
    }
    
    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        pageViewController.setViewControllers(
            //Old code below - this would create the UIHostingController on every update
            
            //[UIHostingController(rootView: pages[0])], direction: .forward, animated: true)
            
            //Now the controller is initialized only once for the life of this page view controller
            //Things in the coordinator are only initialized once, before they are needed for updates
            [context.coordinator.controllers[currentPage]], direction: .forward, animated: true
        )
    }
    
    //A Coordinator type is managed by SwiftUI and is provided to the representable as part of the context
    class Coordinator: NSObject, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
        var parent: PageViewController
        var controllers = [UIViewController]()
        
        init(_ pageViewController: PageViewController) {
            parent = pageViewController
            controllers = parent.pages.map { UIHostingController(rootView: $0) }
        }
        
        //these two functions establish relationships between view controllers so you can swipe back and forth between them
        func pageViewController(
            _ pageViewController: UIPageViewController,
            viewControllerBefore viewController: UIViewController
        ) -> UIViewController? {
            guard let index = controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index == 0 {
                return controllers.last
            }
            return controllers[index - 1]
        }
        
        func pageViewController(
            _ pageViewController: UIPageViewController,
            viewControllerAfter viewController: UIViewController
        ) -> UIViewController? {
            guard let index = controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index + 1 == controllers.count {
                return controllers.first
            }
            return controllers[index + 1]
        }
        
        //This is called by SwiftUI whenever a page switching animation completes
        //Used to find the index of the current view controller and update the binding to currentPage
        func pageViewController(
            _ pageViewController: UIPageViewController,
            didFinishAnimating finished: Bool,
            previousViewControllers: [UIViewController],
            transitionCompleted completed: Bool
        ) {
            if completed,
               let visibleViewController = pageViewController.viewControllers?.first,
               let index = controllers.firstIndex(of: visibleViewController) {
                parent.currentPage = index
            }
        }
        
    }
}
