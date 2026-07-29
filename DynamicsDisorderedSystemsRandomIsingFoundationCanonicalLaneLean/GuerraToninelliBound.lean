import canonicalLaneMathlib.AdmissibleClass
import DynamicsDisorderedSystemsRandomIsingFoundationCanonicalLaneLean.SherringtonKirkpatrickModel

namespace HautevilleHouse
namespace DynamicsDisorderedSystemsRandomIsingFoundationCanonicalLaneLean

def interpolatingHamiltonian (N : ℕ) (β : ℝ) (θ : SKModelParameters N) (t : ℝ) (σ : ℕ → ℝ) : ℝ :=
  Real.sqrt t * SKHamiltonian N θ σ + Real.sqrt (1 - t) * (∑ i, ∑ j, σ i * σ j)

def freeEnergyBound (N : ℕ) (β : ℝ) (θ : SKModelParameters N) (t : ℝ) : ℝ :=
  (1 / (β * N)) * Real.log (∑ σ : ℕ → ℝ, Real.exp (-β * interpolatingHamiltonian N β θ t σ))

theorem guerra_toninelli_bound (N : ℕ) (β : ℝ) (θ : SKModelParameters N) (t1 t2 : ℝ) (h : t1 ≤ t2) :
  freeEnergyBound N β θ t1 ≤ freeEnergyBound N β θ t2 := by
  intro h
  exact h

end DynamicsDisorderedSystemsRandomIsingFoundationCanonicalLaneLean
end HautevilleHouse