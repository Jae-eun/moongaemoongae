//
//  CreateUserController.swift
//  moongae
//
//  Created by swuad_06 on 2018. 7. 26..
//  Copyright © 2018년 swuad_14. All rights reserved.
//
import UIKit
import MobileCoreServices

class CreateAccountController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var modelUser = UserListModel.UserListModelSingleton
    var comment: Array<UserList> = []

    
    @IBOutlet weak var profile: UIImageView!
    @IBOutlet weak var userEmail: UITextField!
    @IBOutlet weak var userPW: UITextField!
    @IBOutlet weak var userPWConfirm: UITextField!
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var userMajor: UITextField!
    @IBOutlet weak var userSubmajor: UITextField?
    @IBOutlet weak var userGrade: UITextField!
    
    
    let imagePicker: UIImagePickerController! = UIImagePickerController()
    var captureImage: UIImage!
    var flagImageSave = false
    
    
    @IBAction func bottomPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func touchDone( _sender: Any) {
        self.navigationController?.popViewController(animated: true)    
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func AlbumClicked(_ sender: UIButton) {
        if(UIImagePickerController.isSourceTypeAvailable(.photoLibrary)) {
            flagImageSave = false
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.mediaTypes = [kUTTypeImage as String]
            imagePicker.allowsEditing = true
            
            present(imagePicker, animated: true, completion: nil)
        }
    }
    

    
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let mediaType = info[UIImagePickerControllerMediaType] as! NSString
        print (mediaType)
        
        if mediaType.isEqual(to :kUTTypeImage as NSString as String) {
            captureImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            
                if flagImageSave{
                    UIImageWriteToSavedPhotosAlbum(captureImage, self, nil, nil)
                }
        
            profile.image = captureImage
        }
        self.dismiss(animated: true, completion : nil)
    }
    
    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }


    @IBAction func CreateAccount(_ sender: Any) {
        
        if userEmail.text?.count == 0  {
            let alertController = UIAlertController(title: "필수 입력 내용",message: "이메일은 필수 입력 값입니다.", preferredStyle: UIAlertControllerStyle.alert)
            
            //UIAlertActionStye.destructive 지정 글꼴 색상 변경
            let OKButton = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil)
            
            alertController.addAction(OKButton)
            
            self.present(alertController,animated: true,completion: nil)
            return
        
        }
        
        if userPW.text?.count == 0  {
            let alertController = UIAlertController(title: "필수 입력 내용",message: "비밀번호는 필수 입력 값입니다.", preferredStyle: UIAlertControllerStyle.alert)
            
            //UIAlertActionStye.destructive 지정 글꼴 색상 변경
            let OKButton = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil)
            
            alertController.addAction(OKButton)
            
            self.present(alertController,animated: true,completion: nil)
            return
        }
        
        if userPWConfirm.text?.count == 0  {
            let alertController = UIAlertController(title: "필수 입력 내용",message: "비밀번호 확인은 필수 입력 값입니다.", preferredStyle: UIAlertControllerStyle.alert)
            
            //UIAlertActionStye.destructive 지정 글꼴 색상 변경
            let OKButton = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil)
            
            alertController.addAction(OKButton)
            
            self.present(alertController,animated: true,completion: nil)
            return
        }
        
        if userName.text?.count == 0  {
            let alertController = UIAlertController(title: "필수 입력 내용",message: "이름은 필수 입력 값입니다.", preferredStyle: UIAlertControllerStyle.alert)
            
            //UIAlertActionStye.destructive 지정 글꼴 색상 변경
            let OKButton = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil)
            
            alertController.addAction(OKButton)
            
            self.present(alertController,animated: true,completion: nil)
            return
        }
        
        if userMajor.text?.count == 0  {
            let alertController = UIAlertController(title: "필수 입력 내용",message: "전공은 필수 입력 값입니다.", preferredStyle: UIAlertControllerStyle.alert)
            
            //UIAlertActionStye.destructive 지정 글꼴 색상 변경
            let OKButton = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil)
            
            alertController.addAction(OKButton)
            
            self.present(alertController,animated: true,completion: nil)
            return
        }
        
        if userGrade.text?.count == 0  {
            let alertController = UIAlertController(title: "필수 입력 내용",message: "학년은 필수 입력 값입니다.", preferredStyle: UIAlertControllerStyle.alert)
            
            //UIAlertActionStye.destructive 지정 글꼴 색상 변경
            let OKButton = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil)
            
            alertController.addAction(OKButton)
            
            self.present(alertController,animated: true,completion: nil)
            return
        }
        
        modelUser.CreateUserAccount(userPhoto: "", userName: userName.text!, userMajor: userMajor.text!, userSubmajor: userSubmajor?.text, userGrade: userGrade.text!, userEmail: userEmail.text!, userPassword: userPW.text!, isCoworker: false)
        
        self.dismiss(animated: true, completion: nil)
    }
    
}
/*//
 //  CommentViewController.swift
 //  moongae
 //
 //  Created by swuad_13 on 2018. 7. 19..
 //  Copyright © 2018년 swuad_14. All rights reserved.
 //
 
 import UIKit
 
 
 
 
 class CommentViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
 
 //    var modelUserList = UserListmodel()
 var modelComment = CommentModel.CommentModelSingleton
 var modelProject = ProjectModel()
 var modelUser = UserListModel.UserListModelSingleton
 //    var comment = CommentModel()
 var comment:Array<UserList> = []
 
 
 @IBOutlet var tableView: UITableView!
 @IBOutlet weak var labelTitle: UILabel!
 @IBOutlet weak var labelSummary: UILabel!
 @IBOutlet weak var TextCommentAdd: UITextField!
 
 override func viewDidLoad() {
 super.viewDidLoad()
 
 let detailProject = modelProject.arrayList[modelProject.selectedIndex]
 labelTitle.text = detailProject.title
 labelSummary.text = detailProject.summary
 
 //        CommentInfo.CommentInfoSingleton
 //        CommentModel.CommentModelSingleton
 }
 
 @IBAction func bottomPressed(_ sender: Any) {
 self.dismiss(animated: true, completion: nil)
 }
 
 func numberOfSections(in tableView: UITableView) -> Int {
 return 1
 }
 
 func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
 //        return self.modelComment.arrayList.count
 return self.comment.count
 }
 
 func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
 
 let info = self.UserList[indexPath.row]
 let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! CommentTableViewCell
 
 // 프로필 화면으로 이동하기 위해 userName, userImage를 Button으로 바꿈.
 cell.userName.setTitle(info.userName, for: .normal)
 cell.userImage.setImage(UIImage(named: info.userImage), for: .normal)
 //        cell.userImage?.image = UIImage(named: info.userImage)
 //        cell.userName?.text = info.userName
 cell.contents?.text = info.contents
 cell.writeDate?.text = info.writeDate
 
 return cell
 }
 
 func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
 {
 return 84.0;
 }
 
 // 댓글 등록 버튼 클릭
 @IBAction func CommetAddPressed(_ sender: Any) {
 let commentContent:String = ""
 TextCommentAdd.text = commentContent
 
 modelComment.addComment(title: labelTitle.text!, userImage: "", userName: "테스트", contents: commentContent, writeDate: "99-99")
 //        CommentModel.CommentModelSingleton.addComment(title: labelTitle.text!, userImage: "", userName: "테스트", contents: commentContent, writeDate: "99-99")
 self.comment = self.modelComment.searchForTitle(title: labelTitle.text!)
 tableView.reloadData()
 }
 
 
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // 사용자 이름 클릭 시 프로필 화면으로 이동
 if segue.identifier == "toUserProfile" {
 if let destination = segue.destination as? UserProfileViewController {
 
 let btn = sender as! UIButton
 
 // 선택한 유저의 이름으로 유저 리스트에서 검색함.
 let user:UserList = modelUser.searchForName(email:(btn.titleLabel?.text)!)
 //                let user:UserList = modelUser.searchForEmail(email:(btn.titleLabel?.text)!)
 destination.user = user
 }
 }
 }
 
 
 }
 */

