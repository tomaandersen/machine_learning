clear;
clc;

size_spec = [2 Inf];
format_spec = '%i %i';

file_fr = fopen('fr', 'r');
file_eng = fopen('eng', 'r');

FR = fscanf(file_fr, format_spec, size_spec)';
ENG = fscanf(file_eng, format_spec, size_spec)';


max_char_count = max([max(FR(:, 1)) max(ENG(:,1))]);
max_a_count = max([max(FR(:, 2)) max(ENG(:,2))]);

x_fr = FR(:,1)./max_char_count;
y_fr = FR(:, 2)./max_a_count;

x_eng = ENG(:,1)./max_char_count;
y_eng = ENG(:, 2)./max_a_count;
eng = '0';
fr = '1';

eng = strcat('0', ':', num2str(x_eng(:,1)), {' '});
yeng = strcat('1', ':', num2str(y_eng(:,1)), {' '});
eng = [eng yeng];
eng = [eng{:}];
eng = regexprep(eng, ':\s+', ':');
eng = ['0 ' eng]
fr = strcat('0', ':', num2str(x_fr(:,1)), {' '});
yfr = strcat('1', ':', num2str(y_fr(:,1)), {' '});
fr = [fr yfr];
fr = [fr{:}];
fr = regexprep(fr, ':\s+', ':');
fr = ['1 ' fr]

W_fr = StochasticGradientDescent([x_fr y_fr], 0.01);
W_eng = StochasticGradientDescent([x_eng y_eng], 0.01);

x = linspace(0, 1, 100);
y_grad_fr = polyval(W_fr, x);
y_grad_eng = polyval(W_eng, x);

plot(x, y_grad_fr, '-b');
hold on;
plot(x, y_grad_eng, '-r');
hold on;
plot(x_fr, y_fr , '+b');
hold on;
plot(x_eng, y_eng, '+r');

xlabel('Letter count');
ylabel('Letter "A" count');
legend('Fr', 'Eng');


