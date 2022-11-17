%find min
function min = find_min(a,b,c)

if a<b&&a<c
    min=a;
elseif b<a&&b<c
    min=b;
else
    min=c;
    
end
