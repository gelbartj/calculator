//
//  CalculatorViewController.m
//  Calculator
//
//  Created by Jonathan Gelbart on 2/11/11.
// 
//

#import "CalculatorViewController.h"

@implementation CalculatorViewController
@synthesize button1;
@synthesize answer;
@synthesize hiddenAnswer;
@synthesize operatorLabel;
@synthesize equalsLabel;

NSString *doMath(NSString *operator, NSString *input1, NSString *input2) {
	// do math
	double result;
	int hasDecimal;
	double value1 = [input1 doubleValue];
	double value2 = [input2 doubleValue];
	if ([operator isEqualToString:@"+"]) {
		result = value1 + value2;
	}
	if ([operator isEqualToString:@"*"]) {
		result = value1 * value2;
	}
	if ([operator isEqualToString:@"–"]) {
		result = value1 - value2;
	}
	if ([operator isEqualToString:@"÷"]) {
		result = value1 / value2;
	}
	// shave zeros off result
	int intResult = (int)result;
	NSString *stringIntResult = [NSString stringWithFormat:@"%d", intResult];
	NSString *stringResult = [NSString stringWithFormat:@"%f", result];
	NSString *charToString = [[NSString alloc] init];
	NSString *charToStringNext = [[NSString alloc] init];
	for (int i = 0; i < [stringResult length]-1; i++) {
		charToString = [NSString stringWithFormat:@"%c", [stringResult characterAtIndex:i]];
		if  ([charToString isEqualToString:@"."]) {
			hasDecimal++;
			break;
		}
	}
	for (int i=[stringResult length]-1; i > 0; i--) {
		int j = i - 1;
		charToString = [NSString stringWithFormat:@"%c", [stringResult characterAtIndex:i]];
		if (hasDecimal > 0) {
			charToStringNext = [NSString stringWithFormat:@"%c", [stringResult characterAtIndex:j]];
			if  ([charToString isEqualToString:@"0"] && ![charToStringNext isEqualToString:@"0"]) {
				if  ([charToStringNext isEqualToString:@"."]) {
					stringResult = [stringResult substringToIndex:j];
					break;
				}
				else {
					stringResult = [stringResult substringToIndex:i];
					break;
				}	
			}
		}
	}
	// Prevent overflows
	if (result <= 999999999999) {
		if (result == intResult) {
		return stringIntResult; 
		}
		
		return stringResult; 
		
	}
	else {
		return @"Error - number too large";
	}
}

// Is a string nil?
BOOL stringZero(NSString *inputString) {
	if ([inputString length] == 0) {
		return YES;
	}
	
		return NO;
	
}

//Prevent string overflows
NSString *returnWithShortening(NSString *inputString) {
	int length = [inputString length];
	NSString *shortenedString = inputString;
	if (length >= 12) {
		shortenedString = [inputString substringToIndex:12];
	}
	return shortenedString;
}
		


- (IBAction)addNumbers:(id)sender {
	NSString *number = [sender currentTitle]; // Button just pressed
	NSString *currentAnswer = answer.text;
	NSString *newAnswer = [[NSString alloc] init];
	NSString *hiddenString = hiddenAnswer.text; // Result of last calculation 
	NSString *equals = equalsLabel.text; // Has equals button been pressed?
	NSString *result;
	
	// Plus button
	if ([number isEqualToString:@"+"]) {
		if ([operatorLabel.text isEqualToString:@"0"]) { operatorLabel.text = @"+"; } 
		if (stringZero(hiddenString)) { 
			hiddenAnswer.text = currentAnswer;
			answer.text = @"";
			operatorLabel.text = @"+"; 
		}
		else if (stringZero(currentAnswer)) {
			operatorLabel.text = @"+";
		}
		else {
			if ([equals isEqualToString:@"0"]) {
			result = doMath(operatorLabel.text, hiddenString, currentAnswer);
			hiddenAnswer.text = result;
			answer.text = @"";
			operatorLabel.text = @"+"; 
			}
			else {
				answer.text = @"";
				operatorLabel.text = @"+";
				equalsLabel.text = @"0";
				
			}
		}
	}
	
	// Multiply button
	else if ([number isEqualToString:@"×"]) {
		if ([operatorLabel.text isEqualToString:@"0"]) { operatorLabel.text = @"*"; } 
		if (stringZero(hiddenString)) { 
			hiddenAnswer.text = currentAnswer;
			answer.text = @"";
			operatorLabel.text = @"*"; 
		}
		else if (stringZero(currentAnswer)) {
			operatorLabel.text = @"*";
		}
		else {
			if ([equals isEqualToString:@"0"]) {
				result = doMath(operatorLabel.text, hiddenString, currentAnswer);
				//hiddenString = [NSString stringWithFormat:@"%f", result];
				hiddenAnswer.text = result;
				answer.text = @"";
				operatorLabel.text = @"*"; 
			}
			else {
				answer.text = @"";
				operatorLabel.text = @"*";
				equalsLabel.text = @"0";
				
			}
		}
		
	}
	
	// Subtract button
	else if ([number isEqualToString:@"–"]) {
		if ([operatorLabel.text isEqualToString:@"0"]) { operatorLabel.text = @"–"; } 
		if (stringZero(hiddenString)) { 
			hiddenAnswer.text = currentAnswer;
			answer.text = @"";
			operatorLabel.text = @"–"; 
		}
		else if (stringZero(currentAnswer)) {
			operatorLabel.text = @"–";
		}
		else {
			if ([equals isEqualToString:@"0"]) {
				result = doMath(operatorLabel.text, hiddenString, currentAnswer);
				//hiddenString = [NSString stringWithFormat:@"%f", result];
				hiddenAnswer.text = result;
				answer.text = @"";
				operatorLabel.text = @"–"; 
			}
			else {
				answer.text = @"";
				operatorLabel.text = @"–";
				equalsLabel.text = @"0";
				
			}
		}		
	}
	
	// Divide button
	else if ([number isEqualToString:@"÷"]) {
		if ([operatorLabel.text isEqualToString:@"0"]) { operatorLabel.text = @"÷"; } 
		if (stringZero(hiddenString)) { 
			hiddenAnswer.text = currentAnswer;
			answer.text = @"";
			operatorLabel.text = @"÷"; 
		}
		else if (stringZero(currentAnswer)) {
			operatorLabel.text = @"÷";
		}

		else {
			if ([equals isEqualToString:@"0"]) {
				result = doMath(operatorLabel.text, hiddenString, currentAnswer);
				//hiddenString = [NSString stringWithFormat:@"%f", result];
				hiddenAnswer.text = result;
				answer.text = @"";
				operatorLabel.text = @"÷"; 
			}
			else {
				answer.text = @"";
				operatorLabel.text = @"÷";
				equalsLabel.text = @"0";
				
			}	
		}
		
	}
	
	// Equals button
	else if ([number isEqualToString:@"="]) {
		if ([equals isEqualToString:@"0"] && !stringZero(hiddenString) && !stringZero(currentAnswer)) {
		result = doMath(operatorLabel.text, hiddenString, currentAnswer);
		//hiddenString = [NSString stringWithFormat:@"%f", result];
		hiddenAnswer.text = result;
		answer.text = returnWithShortening(result);
		operatorLabel.text = @"0";
		equalsLabel.text = @"1";
		}
		else {
			// do nothing. potentially add "repeat last calculation" here
		}
		
	}
	
	// All Clear button
	else if ([number isEqualToString:@"AC"]) {
		answer.text = @"0";
		hiddenAnswer.text = @"";
		operatorLabel.text = @"0";
		equalsLabel.text = @"0";
	}
	
	// Clear Entry button
	else if ([number isEqualToString:@"CE"]) {
		if ([equals isEqualToString:@"0"]) {
			answer.text = @"";
		}
	}	
	
	// Point button
	else if ([number isEqualToString:@"."]) {
		if ([equals isEqualToString:@"0"]) {
			// Don't allow more than one decimal point in a number
			int j = 0;
			NSString *charToString = [[NSString alloc] init];
			for (int i=0; i < [currentAnswer length]; i++) {
				charToString = [NSString stringWithFormat:@"%c", [currentAnswer characterAtIndex:i]];
				if  ([charToString isEqualToString:@"."]) {
					j++;
				}
			}
			if (j == 0) {
				if ([currentAnswer isEqualToString:@""]){
					newAnswer = @"0.";
				}
				else { 
					newAnswer = [NSString stringWithFormat:@"%@%@", currentAnswer, number]; 
				}
				answer.text = newAnswer; 
			}
		}
		
		// If equals button has just been pressed, pressing "." should clear the entry
		else {
			newAnswer = @"0.";
			answer.text = newAnswer;
			hiddenString = @"";
			hiddenAnswer.text = hiddenString;
			equalsLabel.text = @"0";
		}
			
	}
	
	// Numbers buttons
	else { 
		if ([currentAnswer isEqualToString:@"0"]) {
			newAnswer = number;
			answer.text = newAnswer;
		}
		else if ([equals isEqualToString:@"1"]) {
			hiddenString = @"";
			newAnswer = number;
			answer.text = newAnswer;
			hiddenAnswer.text = hiddenString;
			equalsLabel.text = @"0";
		}
		else {
			if ([currentAnswer length] <= 11) {
				newAnswer = [NSString stringWithFormat:@"%@%@", currentAnswer, number]; 
			answer.text = newAnswer; 
			}
		}
	}
	
}	


/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/



// Implement viewDidLoad to do resultal setup after loading the view, typically from a nib.
/*- (void)viewDidLoad {
	[super viewDidLoad];
 [[button1 layer] setCornerRadius:8.0f];
 [[button1 layer] setMasksToBounds:YES];
 [[button1 layer] setBorderWidth:1.0f];
	[[button1 layer] setBackgroundColor:[[UIColor redColor] CGColor]];
    
}*/



// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
 }

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end
