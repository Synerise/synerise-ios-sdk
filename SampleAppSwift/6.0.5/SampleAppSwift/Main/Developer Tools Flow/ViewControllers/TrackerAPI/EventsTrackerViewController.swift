//
//  EventsTrackerViewController.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit

class EventsTrackerViewController: DefaultViewController {
  @IBOutlet var testButton: DefaultButton!
  @IBOutlet var testSwitch: UISwitch!
  @IBOutlet var testSegmentedControl: UISegmentedControl!
  @IBOutlet var testSlider: UISlider!
  @IBOutlet var testStepper: UIStepper!
  @IBOutlet var stepperValueLabel: UILabel!
  @IBOutlet var testDateAndTimePicker: UIDatePicker!
  @IBOutlet var testDatePicker: UIDatePicker!
  @IBOutlet var testTimePicker: UIDatePicker!

  override func viewDidLoad() {
    super.viewDidLoad()

    self.navigationItem.title = "VIEW_CONTROLLER_EVENTS_TRACKER_TITLE".localized()

    prepareBackButton()
  }

  @IBAction func testButtonTapped(_ sender: DefaultButton) {
    sender.animateTapping()
  }

  @IBAction func testSwitchValueChanged(_ sender: Any) {}

  @IBAction func testSegmentedControlValueChanged(_ sender: Any) {}

  @IBAction func testSliderValueChanged(_ sender: Any) {}

  @IBAction func testStepperValueChanged(_ sender: UIStepper) {
    stepperValueLabel.text = String(format: "%.0f", sender.value)
  }

  @IBAction func testDateAndTimePickerValueChanged(_ sender: Any) {}

  @IBAction func testDatePickerValueChanged(_ sender: Any) {}

  @IBAction func testTimePickerValueChanged(_ sender: Any) {}
}
