
function W = BatchGradientDescent(L, learn_rate)
convergence_distance = 1E-10;

w0 = 0.5;
w1 = 0;

while 1 == 1
    error_sum_der_w0 = 0;
    error_sum_der_w1 = 0;  
        
   for e = 1: length(L(:, 1))
       y = L(e, 2);
       x = L(e, 1);
       
       error_sum_der_w0 = error_sum_der_w0 + (y - (w0 + w1 * x));
       error_sum_der_w1 = error_sum_der_w1 + x * (y - (w0 + w1 * x));
   end
   
   w0 = w0 + learn_rate * error_sum_der_w0;
   w1 = w1 + learn_rate * error_sum_der_w1;
   
   if (error_sum_der_w0^2 <= convergence_distance && error_sum_der_w1^2 <= convergence_distance)
       W = [w1 w0];
    break;
   end
  
end


end