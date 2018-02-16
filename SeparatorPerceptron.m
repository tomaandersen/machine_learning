function [ POLYNOM ] = SeparatorPerceptron(TRAINING_SET, learn_rate)
    clear;
    clc;

    learn_rate = 1;
    % X matrix    : [1   1  1  1]
    %               [x1 x2 x3 x4]

    % Y matrix :    [1 0 1 1 0] (CLASS)


    X = [1 1 1 1 1; 22 23 31 28 27; 10 2 12 9 3];
    Y = [1 0 1 1 0];

    W = [0 0 0];


    while 1 == 1

       Y_HAT = W * X;

       % THRESHOLD FUNCTION = 1 if y_hat >= 0, 0 if y_hat < 0.
       H = (Y_HAT >= 0);

       ERROR = Y - H;

       % Update weights (using perceptron learning rule formula)
       W = W + learn_rate .* ERROR * (X');

       error_count = sum(abs(ERROR));

       if error_count == 0
           break
       end
    end
    
    return;
end

