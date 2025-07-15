//
//  NewTaskViewController.swift
//  ToDoList
//
//  Created by Aryan Menon on 07/07/25.
//

import UIKit

//TODO: -Move to seperate protocol class
/**
NewTaskDelegate links NewTaskViewController and NewTaskModalView. This helps NewTaskViewController to know when to dismiss when the x button is tapped on the
NewTaskModalView and to present an error alert when a user enters invalid input.
 */
protocol NewTaskDelegate : AnyObject {
    ///Dismiss the NewTaskViewController. Called when the x button on the NewTaskModalView is tapped
    func closeView()
    /**
    This presents an error alert when the user enters an invalid input.
     - Parameters:
        -title: This is the title of the alert
        -message:  A short description of what went wrong
     */
    func presentErrorAlert(title: String, message: String)
}
///This class is responsible for creating a new task or editing an existing one
class NewTaskViewController: UIViewController {
    
    lazy var modalView : NewTaskModalView = {
        let modalWidth = view.frame.width - CGFloat(30)
        let modalHeight = CGFloat(430)
        let frame = CGRect(x: 15, y: view.center.y - (modalHeight/2), width: modalWidth, height: modalHeight)
        let modalView = NewTaskModalView(frame: frame, task: task)
        modalView.delegate = self
        return modalView
    }()
    
    private var task: Task?
    /**
        This creates NewTaskViewController
        - Parameters:
                -task: If a task is being edited, task should be passed, if a new task is being created, task should be nil
        - Returns: NewTaskViewController with a NewTaskModalView for the user to edit or create a task
     */
    
    init(task: Task? = nil) {
        super.init(nibName: nil, bundle: nil)
        modalTransitionStyle = .crossDissolve
        modalPresentationStyle = .overFullScreen
        self.task = task
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        modalView.transform = CGAffineTransform(scaleX: 0, y: 0)
        view.addSubview(modalView)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //We change the transform of the modal view to zero to perform a scale up animation when the view appears
        modalView.scaleUpAnimation()
        
    }
    
}



//MARK: - Conformance to NewTaskDelegate
extension NewTaskViewController : NewTaskDelegate {
    
    func presentErrorAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    
    func closeView() {
        dismiss(animated: true)
    }
    
}
