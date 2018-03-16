function [Vmap] = potmatrix (nx,ny,rho,cMap);



    G = sparse(nx*ny); 

    B = zeros(1,nx*ny); 



 for i = 1:nx 

    for j = 1:ny 

        n = j + (i - 1) * ny; 

        B(n) = rho(i,j); 



        if i == 1 

            G(n, :) = 0; 

            G(n, n) = 1; 

          

        elseif i == nx 

            G(n, :) = 0; 

            G(n, n) = 1; 

            B(n) = 0; 

        elseif j == 1 

            G(n, :) = 0; 

            G(n, n) = 1; 

           

        elseif j == ny

            G(n, :) = 0; 

            G(n, n) = 1; 

            B(n) = 0; 



         else 

            nxm = j + (i-2)*ny; 

            nxp = j + (i)*ny; 

            nym = j-1 + (i-1)*ny; 

            nyp = j+1 + (i-1)*ny; 



            rxm = (cMap(i,j) + cMap(i-1,j))/2.0; 

            rxp = (cMap(i,j) + cMap(i+1,j))/2.0; 

            rym = (cMap(i,j) + cMap(i,j-1))/2.0; 

            ryp = (cMap(i,j) + cMap(i,j+1))/2.0; 



            G(n,n) = -(rxm+rxp+rym+ryp); 

            G(n,nxm) = rxm; 

            G(n,nxp) = rxp; 

            G(n,nym) = rym; 

            G(n,nyp) = ryp; 

        end 



    end 

 end  



  V = G\B'; 



  Vmap = zeros(nx,ny); 

  for i = 1:nx 

    for j = 1:ny 

        n = j + (i - 1) * ny; 



        Vmap(i, j) = V(n); 

    end 

  end 



 end

