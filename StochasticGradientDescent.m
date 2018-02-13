function [ output_args ] = StochasticGradientDescent( input_args )

function W = BatchGradientDecent(L, learn_rate)
convergence_distance = 1E-10;

w0 = 0.5;
w1 = 0;
w0_pre = 0;
w1_pre = 0;
while 1 == 1
   randnum = rand(1, 15);
   x = L(randnum, 1);
   y = L(randnum, 2);
   
   w0 = w0 + learn_rate *  (y - (w0 + w1 * x));
   w1 = w1 + learn_rate * x * (y - (w0 + w1 * x));
   
   if ( <= convergence_distance &&  <= convergence_distance)
       W = [w1 w0];
    break;
   end
  
end


end

end

