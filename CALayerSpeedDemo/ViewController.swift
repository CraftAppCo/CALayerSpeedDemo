//
//  ViewController.swift
//  CALayerSpeedDemo
//
//  Crafted by Mike Gilroy on 19/03/2018.
//  Copyright © 2018 CraftAppCo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var tableView: UITableView!
	@IBOutlet weak var slider: UISlider!
	@IBOutlet weak var speedLabel: UILabel!
	
	@IBAction func sliderValueChanged(_ sender: UISlider) {
		let roundedSpeed = round(sender.value / speedIncrement) * speedIncrement
		sender.value = roundedSpeed
		UIApplication.shared.windows.first?.layer.speed = roundedSpeed
		speedLabel.text = "Window Speed = \(roundedSpeed)"
	}
	
	private let speedIncrement: Float = 0.1
	
	lazy private var items: [CellViewModel] = {
		return buildItems()
	}()

	override func viewDidLoad() {
		super.viewDidLoad()
		
		title = "Demo"
		
		let speed = UIApplication.shared.windows.first!.layer.speed
		speedLabel.text = "Window Layer Speed = \(speed)"
		
		tableView.delegate = self
		tableView.dataSource = self
		tableView.backgroundColor = UIColor.lightGray
		tableView.tableFooterView = UIView(frame: .zero)
	}
	
	private func buildItems() -> [CellViewModel] {
		let testPush = CellViewModel(title: "Test push", accessoryType: .disclosureIndicator, action: self.testPush)
		let testPresent = CellViewModel(title: "Test present", action: self.testPresent)
		let testAlert = CellViewModel(title: "Test alert", action: self.testAlert)
		let testActionSheet = CellViewModel(title: "Test action sheet", action: self.testActionSheet)
		return [testPush, testPresent, testAlert, testActionSheet]
	}
	
	private func testPush() {
		let viewController = UIViewController()
		viewController.view.backgroundColor = UIColor.red
		navigationController?.pushViewController(viewController, animated: true)
	}
	
	private func testPresent() {
		let viewController = UIViewController()
		viewController.view.backgroundColor = UIColor.green
		viewController.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancel))
		let navController = UINavigationController(rootViewController: viewController)
		present(navController, animated: true, completion: nil)
	}
	
	@objc private func cancel() {
		dismiss(animated: true, completion: nil)
	}
	
	private func testAlert() {
		let testAlert = UIAlertController(title: "Test alert", message: "Test message", preferredStyle: .alert)
		testAlert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
		present(testAlert, animated: true, completion: nil)
	}
	
	private func testActionSheet() {
		let testAlert = UIAlertController(title: "Test action sheet", message: "Test message", preferredStyle: .actionSheet)
		testAlert.addAction(UIAlertAction(title: "Okay, got it", style: .default, handler: nil))
		testAlert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))
		present(testAlert, animated: true, completion: nil)
	}
}

extension ViewController: UITableViewDataSource {
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return items.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let item = items[indexPath.row]
		let cell = UITableViewCell()
		cell.accessoryType = item.accessoryType
		cell.textLabel?.text = item.title
		return cell
	}
}

extension ViewController: UITableViewDelegate {
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let item = items[indexPath.row]
		item.action?()
		tableView.deselectRow(at: indexPath, animated: true)
	}
}
