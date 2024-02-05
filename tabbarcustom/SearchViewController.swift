//
//  SearchViewController.swift
//  tabbarcustom
//
//  Created by 신지연 on 2024/01/31.
//

import UIKit
import SnapKit

class SearchViewController: UIViewController {
    
    
    let backView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray300
        return view
        
    }()
    
    //contentView-1
    private let titleContent: UILabel = {
        let title = UILabel()
        title.text = "최근 검색한 사진"
        title.font = UIFont(name: "Pretendard-Bold", size: 18)
        title.textColor = UIColor.gray900
        title.clipsToBounds = true
        return title
        
    }()
    
    private let btnDeleteCompletely: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("전체 삭제", for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard", size: 14)
        button.tintColor = .gray700
        return button
    }()
    
    let collectionViewFlowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 11
        return layout
    }()
    
    private lazy var cardContent: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(PhotoCardCollectionViewCell.self, forCellWithReuseIdentifier: "PhotoCardCollectionViewCell")
        collectionView.backgroundColor = .yellow
        
        return collectionView
    }()
    
    
    private func updateContentViewForRecentContent() {
        print("최근검색한 사진")
        
        contentView.addSubview(titleContent)
        contentView.addSubview(btnDeleteCompletely)
        contentView.addSubview(cardContent)
        
        
        titleContent.snp.remakeConstraints { make in
            make.leading.equalTo(contentView.snp.leading).offset(4)
            make.top.equalTo(contentView.snp.top)
        }
        
        btnDeleteCompletely.snp.makeConstraints { make in
            make.top.trailing.equalTo(contentView)
        }
        
        cardContent.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(38)
            make.leading.trailing.bottom.equalTo(contentView)
            
        }
        
    }
    
    private func updateContentViewForRecentContentNone() {
        print("최근검색한 사진없음")
        
        let icon = UIImageView()
        icon.image = UIImage.icoEmptySearch.withRenderingMode(.alwaysTemplate)
        icon.tintColor = .gray500
        
        
        let text = UILabel()
        text.text = "최근 검색한 사진이 없습니다."
        text.font = UIFont(name: "Pretendard", size: 14)
        text.textColor = .gray500
        
        contentView.addSubview(icon)
        contentView.addSubview(text)
        
        icon.snp.remakeConstraints { make in
            make.height.width.equalTo(48)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(text.snp.top).offset(-10)
        }
        
        text.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            
        }
        
        
        
    }
    
    
    
    
    
    @objc func back() {
            self.navigationController?.popViewController(animated: true)
        }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.backView)
        self.view.addSubview(self.contentView)
        
        
        //네비게이션 바 커스터마이징
        let backbutton = UIBarButtonItem(image: UIImage.icoLineArrowLeft, style: .done, target: self, action: #selector(back))
        backbutton.tintColor = .gray900
        self.navigationItem.leftBarButtonItem = backbutton
        let searchBar = UISearchBar()
        searchBar.placeholder = "추억을 찾아드려요"
        
        self.navigationItem.titleView = searchBar
        

        
        
        //setUI
        backView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    
        contentView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(22)
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
        
        //updateContentViewForRecentContentNone()
        updateContentViewForRecentContent()
        
    }
    

}


extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // Return the number of cells
        return 3 // or any other value based on your data
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCardCollectionViewCell", for: indexPath) as? PhotoCardCollectionViewCell else {
            return UICollectionViewCell()
        }
        // Configure your cell here
        // ...
        return cell
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Return the size for each cell
        return CGSize(width: 166, height: 218)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        // Return the minimum line spacing
        return 10.0 // or any other value based on your preference
    }
    
}


