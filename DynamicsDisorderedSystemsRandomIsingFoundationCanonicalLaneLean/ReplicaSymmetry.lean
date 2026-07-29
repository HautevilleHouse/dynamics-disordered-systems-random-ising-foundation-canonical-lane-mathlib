import canonicalLaneMathlib.AdmissibleClass
import DynamicsDisorderedSystemsRandomIsingFoundationCanonicalLaneLean.SpinGlassHamiltonian

namespace HautevilleHouse
namespace DynamicsDisorderedSystemsRandomIsingFoundationCanonicalLaneLean

structure ReplicaMatrix (n : ℕ) where
  overlap : (ℕ → ℕ → ℝ)
  diagonal : ℕ → ℝ
  offDiagonal : (ℕ × ℕ) → ℝ
  symmetric : Prop
  positiveDefinite : Prop

def replicaFreeEnergy (n : ℕ) (β : ℝ) (H : SpinGlassHamiltonian n) : ℝ :=
  (1 / (β * n)) * Real.log (∑ σ : ℕ → ℝ, Real.exp (-β * H.hamiltonian σ))

def parisiFreeEnergyFunctional (q : ℕ → ℝ) (β : ℝ) (h : ℝ) : ℝ :=
  (1 / β) * (Real.log 2 + (1 / 2) * (∑ a, ∑ b, β^2 * q a * q b) + (h^2 * β) / (1 + β * (∑ a, q a)))

end DynamicsDisorderedSystemsRandomIsingFoundationCanonicalLaneLean
end HautevilleHouse