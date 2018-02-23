clc;
clear;




count_matrix = filereader();
w = [1 1 1];
miss = 1;
counter = 0;
update = 1;
learn_rate = 1;
c = 0;
while true
    y = round(rand);
    x_i = randi(15, 1);
    
    if y == 0
        yhat = y - threshhold([1 count_matrix(x_i, 1) count_matrix(x_i, 2)], w);
        if update == 1
            w(update) = w(update) + yhat;
        else
            w(update) = w(update) + yhat*count_matrix(x_i, update-1);
        end
        if yhat ~= 0
            miss = miss + 1; 
        end
    else
        yhat = y - threshhold([1 count_matrix(x_i, 3) count_matrix(x_i, 4)], w);
        if update == 1
            w(update) = w(update) + yhat;
        else
            w(update) = w(update) + yhat*count_matrix(x_i, update+1);
        end
        if yhat ~= 0
            miss = miss + 1; 
        end
    end
    c = c+1;
    learn_rate = 1000/(1000+c);
    counter = counter + 1;
    if counter == 45
        if miss < 1
            break;
        end
        counter = 0;
        miss = 0;
    end 
    if update == 1 || update == 2
        update = update + 1;
    else 
        update = 1;
    end
end


w = [ w(2)/-w(3) w(1)];
x = linspace(0, 1, 100);
y_perc = polyval(w, x, 1);
x_fr = count_matrix(:,3);
y_fr = count_matrix(:, 4);
x_eng = count_matrix(:,1);
y_eng = count_matrix(:, 2);
plot(x, y_perc, '-b');
hold on;
plot(x_fr, y_fr , '+b');
hold on;
plot(x_eng, y_eng, '+r');
xlabel('Letter count');
ylabel('Letter "A" count');
legend('Divider', 'Eng', 'Fr');