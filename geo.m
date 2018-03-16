function [ J ] = geo(N,s,w);

    l = 20;

    J = ones(N,N); 
    e = N/6;            % Positioning the wells (e,f are coordinatines in J) 
    e = int16(fix(e)); 
    f = N-e; 
    J = J.*s;          % setting sorrounding material properties to 'es' 
    len = l;           % Size of the wells 

    J(e:e+len,e:e+len)   = w;     % Well 1 material properties 
    J(f-len:f,f-len:f)   = w;     % Well 2 material properties 
    J(e:e+len,f-len:f)   = w;     % Well 3 material properties 
    J(f-len:f,e:e+len)   = w;     % Well 4 material properties  

end

