using QuantumOptics
using HCubature  



Nfock=50          # Size of the Fock basis
a=3.75             # parameter infront of the quartic term
b=-1              # parameter infront of the qubic term
kth = 2           # state of interest
theta=0.2         # scaling parameter
L = 7             # Size of the phase space
maxloc = 7.40     # local maximum of the potential
minloc = 0.0      # local maximum of the potential
xpint = 0.1      # size of the grid for the Wigner function






#--------------------------------------------------------------------------------------------------------------------------------------


bc=FockBasis(Nfock)

aop=destroy(bc)
adop=dagger(aop)
x    = (1/2^(1/2))*(aop+adop)
p    = im*(1/2^(1/2))*(adop-aop)


HH  =  (1/2)*p^2+a*x^2+b*x^3
HHs =  (1/2)*exp(-2*im*theta)*p^2 + a*x^2*exp(2*im*theta) + b*x^3*exp(3*im*theta)

evs = eigenstates(dense(HHs))


qbslist = []
println("Metastable states:")
global counter=0
for i in 1:Nfock
  if (real(evs[1][i])>minloc)
    if (real(evs[1][i])<maxloc)
       global counter = counter + 1
       append!(qbslist,i)
       println(counter,"  resonance energy: ",real(evs[1][i]), "  lifetime   :",1/(2*abs((imag(evs[1][i])))))
    end
  end
end


using PyPlot
x = [-L:xpint:L;]
xc = x
pc = x
    subplot(1, 1, 1)
    dilop = exp((im*theta/2)*(adop^2-aop^2))
    #dilop = exp(0)
    global psi = dilop*evs[2][qbslist[kth]]
    Q = wigner(psi, xc, pc)
    QQ = transpose(Q)
    pcolor(x, x, QQ, cmap=:bwr,vmin=-0.2,vmax=0.2)


open("output/Wigner_MetastableState.dat","w") do io
  for i in xc
    for j in xc
      wig = wigner(psi, i, j)
      println(io,i," ",j," ",round(wig,digits=8))
    end
  end
end

tight_layout()
savefig("output/Wigner_MetastableState.png")
println("See file output/Wigner_MetastableState.png for the Wigner function of the ",kth," metastable state")
println("See file output/Wigner_MetastableState.dat for data of the Wigner function of the ",kth," metastable state")





