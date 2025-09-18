using QuantumOptics
using HCubature  



Nfock=50          # Size of the Fock basis
a=2.5             # parameter infront of the quartic term
b=-1              # parameter infront of the qubic term
kth = 1           # state of interest
thetamin=0.1      # starting point for the scaling parameter
thetamax=0.3      # ending point for the scaling parameter
thetaint=0.001     # spacing for the scaling parameter
L = 7             # Size of the phase space
maxloc =  8.0  # local maximum of the potential
minloc = -8.0      # local maximum of the potential
xpint = 0.1       # size of the grid for the Wigner function






#--------------------------------------------------------------------------------------------------------------------------------------


bc=FockBasis(Nfock)

aop=destroy(bc)
adop=dagger(aop)
x    = (1/2^(1/2))*(aop+adop)
p    = im*(1/2^(1/2))*(adop-aop)

thetalist = [i for i in thetamin:thetaint:thetamax]

open("output/eigenvalues_theta.dat","w") do io
for k in thetalist
  HHs =  (1/2)*exp(-2*im*k)*p^2 + a*x^2*exp(2*im*k) + b*x^3*exp(3*im*k) 
  evs = eigenstates(dense(HHs))  
  for i in 1:Nfock
    if (real(evs[1][i])>minloc)
      if (real(evs[1][i])<maxloc)
       println(io,real(evs[1][i])," ",imag(evs[1][i]))
      end
    end
  end
end
end

println("----------------------------------------------------------------------------------------------------------------------------------------")
println(" See file output/eigenvalues_theta.dat for the data corresponding to the eigenvalues found within the relevant interval (minloc,maxloc)")
println(" obtained  varying the scaling parameter theta between thetamin:thetaint:thetamax")
println("----------------------------------------------------------------------------------------------------------------------------------------")





