function count_matrix = filereader( input_args )
%FILEREADER Summary of this function goes here
%   Detailed explanation goes here
data_file_id = fopen('data', 'r');
pause on;
text = fileread('svm.txt');
count_matrix(1:1,1:4) = 0;
A = strsplit(text, '\n');
eng = 1;
fr = 1;
for i = 1 : length(A)
    B = strsplit(char(A(i)), ' ');
    index = B(1);
    x_value = strsplit(char(B(2)), ':');
    y_value = strsplit(char(B(3)), ':');
    if strcmp(index,'0')
        count_matrix(eng, 1) = str2double(char(x_value(2)));
        count_matrix(eng, 2) = str2double(char(y_value(2)));
        eng = eng + 1;
    else
        count_matrix(fr, 3) = str2double(char(x_value(2)));
        count_matrix(fr, 4) = str2double(char(y_value(2)));
        fr = fr + 1;
    end
end

end