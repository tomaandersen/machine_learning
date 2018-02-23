function th = threshhold(x, w)
%THRESHHOLD Summary of this function goes here
%   Detailed explanation goes here

if dot(x, w) >= 0
    th = 1;
else 
    th = 0;
end

end