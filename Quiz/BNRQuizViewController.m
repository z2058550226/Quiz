//
//  BNRQuizViewController.m
//  Quiz
//
//  Created by 张金岩 on 2019/1/14.
//  Copyright © 2019 suikajy. All rights reserved.
//

#import "BNRQuizViewController.h"

@interface BNRQuizViewController ()

@property(nonatomic) int currentQuestionIndex;
@property(nonatomic, copy) NSArray *questions;
@property(nonatomic, copy) NSArray *answers;
@property(nonatomic, weak) IBOutlet UILabel *questionLabel;
@property(nonatomic, weak) IBOutlet UILabel *answerLabel;

@end

@implementation BNRQuizViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil
                         bundle:(NSBundle *)nibBundleOrNil
{
    self=[super initWithNibName:nibNameOrNil
                         bundle:nibBundleOrNil];
    if (self) {
        // create two array to restore the answers and questions.
        // At the same time, let the questions and answers point to each array
        self.questions = @[@"From what is cognac made?",
                           @"What is 7+7?",
                           @"What is the capital of Vermont?"];
        self.answers = @[@"Grapes",
                         @"14",
                         @"Montpelier"];
    }
    return self;
}

- (IBAction)showQuestion:(id)sender{
    // next question
    self.currentQuestionIndex++;
    // Were all questions answered?
    if (self.currentQuestionIndex==[self.questions count]) {
        // return to the first question.
        self.currentQuestionIndex = 0;
    }
    // Get the question according to the index.
    NSString *question = self.questions[self.currentQuestionIndex];
    // Show the question on the Label
    self.questionLabel.text = question;
    // Reset the answer string.
    self.answerLabel.text = @"???";
}
- (IBAction)showAnswer:(id)sender{
    // What is the answer of the current question?
    NSString *answer = self.answers[self.currentQuestionIndex];
    self.answerLabel.text = answer;
}

@end
