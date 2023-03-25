using Plots
using DifferentialEquations

Ea = 10^(-23)
K= 1.38*(10^(23))
V0=0
N0=2000
T0=100
q=25000
c=12
ti=5
"t0=0; tmax=200
t=range(t0, tmax, step=0.1)
u=-1/ti*exp(-Ea/(k*T0))"

function N1(t)
    T=T0+q*t/(N0*c)
    u1=-1/ti*exp(-Ea/(k*T))
    E=rand()*2*Ea
    if E>Ea
        return N0*exp(u1*t)
    else
        return N1(t-0.05)
    end
    
end

function T(t)
    if E>Ea
        return -(q/N0*c)*(N0*exp(u1*t))
        
    else
        return -(q/N0*c)*(N1(t-0.05))
    end     
end


plt = 
    plot(
        layout=(1,2),
        dpi=200,
        legend=false)
    plot!(
        plt[1],
        t,
        N1,
        title="решение уравнения N",
        Xlabel="t"
        color=:blue,
        xlim=[0, 1.1*tmax],
        ylim=[0, 1.1*N0])
    
    plot!(
        plt[1],
        t,
        T,
        title="решение уравнения T",
        Xlabel="t"
        color=:red,
        xlim=[0, 1.1*tmax],
        ylim=[0, 1.1*N0])

        savefig("projet5-3.png")