f = 1800*10^6;
eR = 4.4;
h = 1.6;
c = 3*10^6
Z0 = 50;
W = (1000*((c/(2*f))*sqrt(2/(eR+1))))

eReff = ((eR+1/2)+((eR-1)/2)*((1+12^(h/w))^(-1/2))
deltaL = 0,412*h*((eReff+0.3)*((W/h+0.764))/((eReff-0.258)*((W/h)+0.8))
L = ((c/(2*f*sqrt(eReff)))-(2*(deltaL)*10^-3))*1000

Lg = L+6*h
Wg = W+6*h

lamdaNol = (c/f)*1000
if (W<lamdaNol)
  G1 = (1/90)*((W/lamdaNol)^2)
elseif (W>lamdaNol)
  G1 = (1/120)*((W/lamdaNol)^2)
endif
Za = 1/(2*G1)

y0 = (acos(sqrt(50/Za)))/((3.14)/L)

A = ((Z0/60)*sqrt((eR+1)/2))+((eR-1))*(0.23+(0.11/eR))
Wf = (h*8*exp(A))/((exp(2*A))-2)
