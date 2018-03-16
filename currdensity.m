function [Jd] = currdensity(x,y,z,size,strength);

   

    A111 = strength;

    Jd = zeros(size+1,size+1);

    e = size/8;

    e = int16(fix(e));

    f = size-e;



    Jd(e,e+5:f-5) =  A111*x(1);           %Top-side wire on the grid

    Jd(f,e+5:f-5) =  A111*x(2); 

    Jd(e+5:f-5,e) =  A111*y(1);           %Left-side wire on the grid

    Jd(e+5:f-5,f) =  A111*y(2);

    Jd(e,e)   =  A111*z(1);

    Jd(f,f)   =  A111*z(2);

    Jd(e,f)   =  A111*z(3);

    Jd(f,e)   =  A111*z(4);



    Jd   = Jd(1:end-1,1:end-1); % Take the force function within the domain



end