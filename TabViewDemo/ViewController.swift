//
//  ViewController.swift
//  TabViewDemo
//
//  Created by Kondya on 01/07/18.
//  Copyright © 2018 Kondya. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {

    @IBOutlet weak var indicatorView: UIView!
    @IBOutlet weak var scroll: UIScrollView!
    @IBOutlet weak var viewWidth: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewWidth.constant = self.view.frame.width*3
        self.scroll.delegate = self
        
    }
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        
        
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // Update ScrollView direction
        if(scrollView.panGestureRecognizer.translation(in: scrollView.superview).x > 0) {
            print("left")
            self.indicatorView.frame = CGRect(x:scrollView.contentOffset.x/3 , y: 0, width: self.view.frame.width/3, height: self.indicatorView.frame.height)
            print(scrollView.contentOffset.x )
            
        }
        else {
            print("right")
             self.indicatorView.frame = CGRect(x:scrollView.contentOffset.x/3, y: 0, width: self.view.frame.width/3, height: self.indicatorView.frame.height)
             print(scrollView.contentOffset.x )
        }
    }
    func scrollToPage(_ page: Int) {
        UIView.animate(withDuration: 0.3) {
            self.scroll.contentOffset.x = self.scroll.frame.width * CGFloat(page)
        }
    }
    
    
    @IBAction func chagePageButton(_ sender: UIButton) {
        
        switch sender.tag {
        case 0:
            self.scrollToPage(0)
        case 1:
            self.scrollToPage(1)
        case 2:
            self.scrollToPage(2)
        default:
            print("Noting")
        }
        
    }
    
}

