@testset "FFTGaussSim" begin
  𝒟 = RegularGrid(100,100)
  problem = SimulationProblem(𝒟, :z=>Float64, 3)

  Random.seed!(2019)
  solver = FFTGaussSim(:z => (variogram=GaussianVariogram(range=10.),))
  solution = solve(problem, solver)

  if visualtests
    @plottest plot(solution,size=(900,300)) joinpath(datadir,"FFT-iso.png") !istravis
  end

  Random.seed!(2019)
  solver = FFTGaussSim(:z => (variogram=GaussianVariogram(distance=aniso2distance([20.,5.],[0.])),))
  solution = solve(problem, solver)

  if visualtests
    @plottest plot(solution,size=(900,300)) joinpath(datadir,"FFT-aniso.png") !istravis
  end
end
