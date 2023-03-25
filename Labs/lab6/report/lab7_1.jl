using Plots
using DifferentialEquations

a1 = 0.64
a2 = 0.00004
b1 = 0.00007
b2 = 0.7
c1 = 0.4
c2 = 0.3
N = 1403
n0 = 9

function ode_fn(du, u, p, t)
    x, y, z = u
    du[1] = (a1+a2*u[1])(N-u[1])
    du[2] = (b1+b2*u[1])(N-u[1])
    du[3] = (c1*t+c2*sin(2*t)*u[1])(N-u[1])
end

u0 = [n0, n0, n0]
tspan = (0.0, 30.0)
prob = ODEProblem(ode_fn, u0, tspan)
sol = solve(prob, dtmax=0.1)

X = [u[1] for u in sol.u]
Y = [u[2] for u in sol.u]
Z = [u[3] for u in sol.u]
T = [t for t in sol.t]

plt = 
    plot(
        layout=(1,2,3),
        dpi=300,
        legend=false)
    plot!(
        plt[1],
        T,
        X,
        title="решение уравнения X",
        color=:blue)
    plot!(
        plt[2],
        T,
        Y,
        label="решение уравнения Y",
        color=:yellow)
    plot!(
        plt[3],
        T,
        Z,
        label="решение уравнения Z",
        color=:red)

        savefig("lab7-2.png")