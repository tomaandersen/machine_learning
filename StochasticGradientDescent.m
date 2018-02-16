
function W = StochasticGradientDecent(L, learn_rate)
convergence_distance = 1E-10;

w0 = 0.5;
w1 = 0;
w0_pre = 0;
w1_pre = 0;
while 1 == 1
   randnum = randperm(15, 1);
   x = L(randnum, 1);
   y = L(randnum, 2);
   w0_pre = w0;
   w1_pre = w1;
   w0 = w0 + learn_rate *  2 * (y - (w0 + w1 * x));
   w1 = w1 + learn_rate * 2 * x * (y - (w0 + w1 * x));

   if (abs(w0 - w0_pre) <= convergence_distance && abs(w1 - w1_pre) <= convergence_distance)
       W = [w1 w0];
    break;
   end
  
end


end


