clear;
clc;
close all

data_file_id = fopen('data', 'r');

text = fileread('svm.txt');
count_matrix(1:14,1:4) = 0;
A = strsplit(text, '\n');

for i = 1 : length(A)
    B = strsplit(char(A(i)), ' ');
    index = B(1);
    x_value = strsplit(char(B(2)), ':');
    y_value = strsplit(char(B(3)), ':');
    if strcmp(index,'0')
        count_matrix(i, 1) = str2double(char(x_value(2)));
        count_matrix(i, 2) = str2double(char(y_value(2)));
    else
        count_matrix(i - 15, 3) = str2double(char(x_value(2)));
        count_matrix(i - 15, 4) = str2double(char(y_value(2)));
    end
end

EXAMPLES = [count_matrix(:, 1:2); count_matrix(:, 3:4)];
CLASS = [ones(1, 15)'; zeros(1,15)'];

% ----

% Init W with small random values.
W = [rand rand rand] * 0.02;

% Append dummy ones with the examples.
X = [ones(length(CLASS), 1), EXAMPLES];

learn_rate = 1;
loop = 0;
while 1 == 1
   loop = loop + 1;
   learn_rate = 10000 / (10000 + loop);

    % Random index.
	index = randi(length(CLASS), 1);

	current_example = X(index, :);
	desired_output = CLASS(index);
	actual_output = Logistic(W * current_example');

	l = [0 0 0];
           
	% For each weight
	for w = 1 : 3
        l(w) = learn_rate * (desired_output - actual_output) * actual_output * (1 - actual_output) * current_example(w);      
    end
	% Update weight
	W = W + l;
       
    if (norm(l) <= 0.001) 
        break
    end
end


% Plot
ENG = EXAMPLES(1:15, :);
FR = EXAMPLES(16:end, :);

hold on;
plot(ENG(:, 1), ENG(:, 2), '+r');
plot(FR(:, 1), FR(:, 2), '+b');

A = W./ ((-1) * W(3));
A = A(1:2);
x = linspace(0, 1, 100);
y = polyval([A(2) A(1)], x);
    
plot(x, y, '-g');
axis([0 1 0 1])


legend('Eng', 'Fr')

