//
//  CurationViewController.swift
//  tabbarcustom
//
//  Created by 신지연 on 2024/02/06.
//

import UIKit
import SnapKit

class CurationViewController: UIViewController, UITextFieldDelegate {

    
    let backView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    
    let topView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = 0.4
        view.clipsToBounds = true
        return view
    }()
    
    let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    
    
    //topView
    let topImage: UIImageView = {
        let image = UIImageView()
        image.image = .back01
        image.contentMode = .center
        image.clipsToBounds = true
        return image
    }()
    
    let albumTitle: UILabel = {
        let title = UILabel()
        title.text = "3D 입체 앨범 모형"
        title.font = UIFont(name: "Pretendard-Bold", size: 22)
        title.textColor = .white
        title.backgroundColor = .clear // 배경색 설정
        title.clipsToBounds = true
        return title
    }()
    
    
    
    
    let searchBar: UITextField = {
        let search = UITextField()
        search.placeholder = "  앨범안에 있는 추억을 찾아보세요"
        search.font = UIFont(name: "Pretendard", size: 14)
        search.backgroundColor = .gray700.withAlphaComponent(0.8)
        search.textColor = .white
        search.layer.cornerRadius = 27
        return search
    }()
    
    
    //contentView
    private let titleContent: UILabel = {
        let title = UILabel()
        title.text = "앨범 사진"
        title.font = UIFont(name: "Pretendard-Bold", size: 18)
        title.textColor = UIColor.gray900
        title.clipsToBounds = true
        return title
    }()
    
    private let textFilter: UILabel = {
        let text = UILabel()
        text.font = UIFont(name: "Pretendard", size: 12)
        text.textColor = .gray700
        text.text = "시간순"
        return text
    }()
    
    private let btnFilter: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(.icoArrowDown, for: .normal)
        
        button.backgroundColor = .white
        button.addTarget(CurationViewController.self, action: #selector(filterButtonTapped), for: .touchUpInside)
        button.tintColor = .gray700
        return button
    }()
    
    private let collectionViewFlowLayout: UICollectionViewFlowLayout = {
        let indexPath = IndexPath(item: 0, section: 0)
        let yOffset = 532 / 2
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 15
        //layout.collectionView?.scrollToItem(at: <#T##IndexPath#>, at: <#T##UICollectionView.ScrollPosition#>, animated: <#T##Bool#>)
        return layout
    }()
    
    private lazy var cardContent: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(PhotoCardCollectionViewCell.self, forCellWithReuseIdentifier: "PhotoCardCollectionViewCell")
        collectionView.backgroundColor = .clear
        
        return collectionView
    }()
    
    
    
    
    //
    private func loadTopView(){
        
        let searchButton = UIButton()
        let searchImage = UIImage(named: "icoSearch")
        searchButton.setBackgroundImage(searchImage, for: .normal)
        searchButton.frame = CGRectMake(0,0, 36, 36)
        searchButton.addTarget(self, action: #selector(self.clickSearchButton), for: .touchUpInside)
        
        var buttonConfig = UIButton.Configuration.plain()
        buttonConfig.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 16) // 오른쪽 여백 추가
        searchButton.configuration = buttonConfig
        //searchButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 16) // 오른쪽 여백 추가
        searchBar.leftView = searchButton
        searchBar.leftViewMode = UITextField.ViewMode.always
        searchBar.delegate = self
        
        topView.addSubview(albumTitle)
        topView.addSubview(searchBar)
        
        albumTitle.snp.makeConstraints { make in
            make.top.equalTo(topView).offset(97)
            make.leading.equalToSuperview().offset(20)
        }
        
        searchBar.snp.makeConstraints { make in
            make.height.equalTo(54)
            make.width.equalTo(343)
            make.centerX.equalToSuperview()
            make.top.equalTo(topView.snp.top).offset(156)
        }
    }
    
    private func loadContentView() {
        contentView.addSubview(titleContent)
        contentView.addSubview(btnFilter)
        contentView.addSubview(textFilter)
        contentView.addSubview(cardContent)
        
        titleContent.snp.remakeConstraints { make in
            make.leading.equalTo(contentView.snp.leading).offset(4)
            make.top.equalTo(contentView.snp.top)
        }
        
        btnFilter.snp.makeConstraints { make in
            make.centerY.equalTo(titleContent)
            make.trailing.equalTo(contentView)
            make.width.height.equalTo(14)
        }
        
        textFilter.snp.makeConstraints { make in
            make.trailing.equalTo(btnFilter.snp.leading)
            make.centerY.equalTo(btnFilter)
        }
        
        cardContent.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(38)
            make.leading.trailing.bottom.equalTo(contentView)
            
            
            
        }
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //navigation bar
        let backbutton = UIBarButtonItem(image: UIImage.icoLineArrowLeft, style: .done, target: self, action: #selector(back))
        backbutton.tintColor = .gray300
        self.navigationItem.leftBarButtonItem = backbutton
        let homebutton = UIBarButtonItem(image:.icoHome , style: .done, target: self, action: #selector(back))
        homebutton.tintColor = .gray300
        self.navigationItem.rightBarButtonItem = homebutton
        
        
        
        
        self.view.addSubview(self.backView)
        self.view.addSubview(self.topImage)
        self.view.addSubview(self.topView)
        self.view.addSubview(self.contentView)
        
        backView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        
        topImage.snp.makeConstraints { make in
            make.height.equalTo(226)
            make.leading.trailing.top.equalToSuperview()
        }
        topImage.layer.cornerRadius = 40
        // 특정 모서리에만 코너 라디우스를 적용하는 CACornerMask를 정의합니다.
        let maskedCorners: CACornerMask = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]

        // CACornerMask에 따라 코너 라디우스를 설정합니다.
        let cornerRadius: CGFloat = 40
        topImage.layer.maskedCorners = maskedCorners
        topImage.layer.cornerCurve = .continuous
        topImage.layer.cornerRadius = cornerRadius
        
        topView.layer.cornerRadius = 40
        topView.snp.makeConstraints { make in
            make.height.equalTo(226)
            make.leading.trailing.top.equalToSuperview()
        }
        topView.layer.maskedCorners = maskedCorners
        topView.layer.cornerCurve = .continuous
        topView.layer.cornerRadius = cornerRadius

        
        contentView.snp.makeConstraints { make in
            make.top.equalTo(topView.snp.bottom).offset(26)
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
        
        
        loadTopView()
        loadContentView()
    }
    
    
    @objc func back() {
            self.navigationController?.popViewController(animated: true)
        }
    
    @objc func clickSearchButton() {
            //self.navigationController?.popViewController(animated: true)
        }
    
    @objc private func filterButtonTapped() {
        /*
        // 팝업창 생성 및 설정
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        // 시간순 버튼
        let chronologicalAction = UIAlertAction(title: "시간순", style: .default) { _ in
            // 시간순으로 정렬하는 로직 추가
            self.btnFilter.setTitle("시간순", for: .normal)
        }
        alertController.addAction(chronologicalAction)
        
        // 연관순 버튼
        let relevanceAction = UIAlertAction(title: "연관순", style: .default) { _ in
            // 연관순으로 정렬하는 로직 추가
            self.btnFilter.setTitle("연관순", for: .normal)
        }
        alertController.addAction(relevanceAction)
        
        
        // 현재 뷰 컨트롤러에서 팝업창 표시
        present(alertController, animated: true, completion: nil)
         */
    }

    

}

extension CurationViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
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
        
        return CGSize(width: 166, height: 248)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        // Return the minimum line spacing
        return 10.0 // or any other value based on your preference
    }
    
}
