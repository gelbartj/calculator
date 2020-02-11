//
//  CalculatorViewController.h
//  Calculator
//
//  Created by Jonathan Gelbart on 2/11/11.
//  Copyright 2011 Stanford University. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalculatorViewController : UIViewController {

	UIButton *button1;	
	UILabel *answer;
	UILabel *hiddenAnswer;
	UILabel *operatorLabel;
	UILabel *equalsLabel;

	
	
}

@property (nonatomic, retain) IBOutlet UIButton *button1;
@property (nonatomic, retain) IBOutlet UILabel *answer;
@property (nonatomic, retain) IBOutlet UILabel *operatorLabel;
@property (nonatomic, retain) IBOutlet UILabel *hiddenAnswer;
@property (nonatomic, retain) IBOutlet UILabel *equalsLabel;

- (IBAction)addNumbers:(id)sender;


@end

