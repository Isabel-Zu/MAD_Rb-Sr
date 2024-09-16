%%%%%%%%%%%%---------------------------------------------------------------------------------
%PDP function

classdef fcns_RbSrapp
   methods (Static)
       function probability = pdp(xaxis, steps, value, value_err)
            probability= [];
            probability2= [];
            ft= [];
            for k= 1:1:length(xaxis)
                m= xaxis(k);
                ft=[];
                a=1;
                while (a <= length(value))
                
%                     v_err= value_err(a);
%                     v= value(a);
%                     value_err= round(v_err,3);
%                     value= round(v(a),3);
                    g=1./(abs(value_err(a))*sqrt(2*pi)).*exp((-(m-value(a)).^2)./(2*abs(value_err(a))).^2).*steps;
                    ft= [ft; g];
                    a= a+1;   
                end
                new= sum(ft)/length(value); 
                %new2= sum(ft)/(length(value)*length(xaxis));
                probability= [probability; new];
                %probability2= [probability2; new2];
            end
       end
   end
end

%%%%%%%%%%%%%--------------------------------------------------------------------------