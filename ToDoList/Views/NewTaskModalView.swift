//
//  NewTaskModalView.swift
//  ToDoList
//
//  Created by Aryan Menon on 07/07/25.
//

import UIKit
import os

class NewTaskModalView: UIView {

    @IBOutlet private weak var descriptionTextView: UITextView!
    @IBOutlet private weak var categoryPickerView: UIPickerView!
    @IBOutlet private var contentView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    
    weak var delegate : NewTaskDelegate?
    private var task : Task?
    
    var caption : String {
        get { return descriptionTextView.text }
        set { descriptionTextView.text = newValue }
    }
    
    init(frame: CGRect, task: Task?) {
        super.init(frame: frame)
        self.task = task
        initSubviews()
    }
    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        initSubviews()
//    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initSubviews()
    }
    
    func initSubviews() {
        let nib = UINib(nibName: "NewTaskModalView", bundle: nil)
        nib.instantiate(withOwner: self)
        
        //submitButton.titleLabel?.font = UIFont.style(.buttonTitle)
        descriptionTextView.layer.borderWidth = 0.5
        descriptionTextView.layer.borderColor = UIColor.lightGray.cgColor
        descriptionTextView.layer.cornerRadius = 8
        descriptionTextView.delegate = self
        categoryPickerView.dataSource = self
        categoryPickerView.delegate = self
        
        if let task = task {
            descriptionTextView.text = task.caption
            descriptionTextView.textColor = UIColor.label
            if let rowIndex = Category.allCases.firstIndex(of: task.category) {
                categoryPickerView.selectRow(rowIndex, inComponent: 0, animated: false)
            }
        }
        
        else {
            descriptionTextView.text = "Add caption..."
            descriptionTextView.textColor = UIColor.placeholderText
            categoryPickerView.selectRow(1, inComponent: 0, animated: false)
        }
        
        contentView.frame = bounds
        addSubview(contentView)
        
    }
    /*
     This is appropriate place to change the corner radius because it will account for layout changes and changes in the size of the views
     */
    override func layoutSubviews() {
        contentView.layer.cornerRadius = 5
    }
  
    
    /*
    awakeFromNib is not called because the nib's top level object is connected to the file owner
    */
//    override func awakeFromNib() {
//        print("Nib")
//        super.awakeFromNib()
//    }
    
    @IBAction func submitButtonTapped(_ sender: Any) {
        os_log("LOG_INFO: Task creation has started. Submit button tapped", type: .info)
        guard let caption = descriptionTextView.text,
              descriptionTextView.textColor != UIColor.placeholderText,
              caption.count >= 4 && caption.count <= 50 else {
            delegate?.presentErrorAlert(title: "Caption Error", message: "You need to provide a description between 4 and 50 characters")
            shakeAnimation()
            return
        }
        os_log("LOG_INFO: Validation of the task succeeded", type: .info)
        let selectedRow = categoryPickerView.selectedRow(inComponent: 0)
        let category = Category.allCases[selectedRow]
        if let task = task {
            let task = Task(id: task.id, category: category, caption: caption, createdDate: task.createdDate, isComplete: task.isComplete)
            let userInfo: [String: Task] = ["updateTask": task]
            NotificationCenter.default.post(name: NSNotification.Name("com.fullstacktuts.editTask"), object: nil, userInfo: userInfo)
        }
        else {
            let taskId = UUID().uuidString
            let task = Task(id: taskId, category: category, caption: caption, createdDate: Date(), isComplete: false)
            let userInfo : [String : Task] = ["newTask" : task]
            os_log("LOG_INFO: Task posted as part of notification", type: .info)
            NotificationCenter.default.post(name: NSNotification.Name("com.fullstacktuts.createTask"), object: nil, userInfo: userInfo)
        }
        delegate?.closeView()
    }
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        delegate?.closeView()
    }
}

extension NewTaskModalView : UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.placeholderText {
            textView.text = nil
            textView.textColor = UIColor.label
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Add caption..."
            textView.textColor = UIColor.placeholderText
        }
    }
}

extension NewTaskModalView : UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Category.allCases.count
    }
    
}

extension NewTaskModalView : UIPickerViewDelegate {
    
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        let category = Category.allCases[row]
//        return category.rawValue
//    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var pickerLabel : UILabel? = view as? UILabel
        if pickerLabel == nil {
            pickerLabel = UILabel()
            pickerLabel?.font = UIFont.systemFont(ofSize: 16, weight: .regular)
            pickerLabel?.textAlignment = .center
        }
        let category = Category.allCases[row]
        pickerLabel?.text = category.rawValue
        return pickerLabel!
    }
    
}
