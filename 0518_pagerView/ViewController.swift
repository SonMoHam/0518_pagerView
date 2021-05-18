//
//  ViewController.swift
//  0518_pagerView
//
//  Created by 손대홍 on 2021/05/18.
//

import UIKit
import FSPagerView

class ViewController: UIViewController, FSPagerViewDataSource, FSPagerViewDelegate {
    
    fileprivate let imageNames = ["1.jpeg", "2.jpeg", "3.jpeg", "4.jpeg"]
    
    @IBOutlet weak var leftBtn: UIButton!
    @IBOutlet weak var rightBtn: UIButton!
    
    @IBOutlet weak var myPagerView: FSPagerView! {
        didSet {
            // 페이저뷰에 셀 등록
            self.myPagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
            // 아이템 크기 설정
            self.myPagerView.itemSize = FSPagerView.automaticSize
            // 무한 스크롤
            self.myPagerView.isInfinite = true
            // 자동 스크롤
            self.myPagerView.automaticSlidingInterval = 4.0
        }
    }
    
    @IBOutlet weak var myPageControl: FSPageControl! {
        didSet{
            // 페이지의 개수 = 사진 배열 카운트
            self.myPageControl.numberOfPages = self.imageNames.count
            self.myPageControl.contentHorizontalAlignment = .right
            self.myPageControl.itemSpacing = 15
            self.myPageControl.interitemSpacing = 15
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // myPagerView.dataSource = FSPagerViewDataSource
        self.myPagerView.dataSource = self
        // myPagerView.delegate = FSPagerViewDelegate
        self.myPagerView.delegate = self
        
        self.leftBtn.layer.cornerRadius = self.leftBtn.frame.height / 2
        self.rightBtn.layer.cornerRadius = self.rightBtn.frame.height / 2
    }
    
    // MARK: - IBActions
    @IBAction func onLeftBtnClicked(_ sender: UIButton) {
        print("ViewController - onLeftBtnClicked() called")
    }
    @IBAction func onRightBtnClicked(_ sender: UIButton) {
        print("ViewController - onRightBtnClicked() called")
    }
    
    
    // MARK: - FSPagerView Datasource
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return imageNames.count
    }
    
    // 각 셀 설정
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
        cell.imageView?.image = UIImage(named: self.imageNames[index])
        cell.imageView?.contentMode = .scaleAspectFit
        //        cell.textLabel?.text = ...
        return cell
    }
}

