clc;
clear;


data_file_id = fopen('data', 'r');

text = fileread('svm.txt');

A = strsplit(text, '\n')
   
