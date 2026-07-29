import canonicalLaneMathlib.AdmissibleClass
import DynamicsDisorderedSystemsRandomIsingFoundationCanonicalLaneLean.SpinGlassHamiltonian

namespace HautevilleHouse
namespace DynamicsDisorderedSystemsRandomIsingFoundationCanonicalLaneLean

structure CavityField (N : ℕ) where
  effectiveField : ℕ → ℝ
  magnetization : ℕ → ℝ
  selfConsistency : (i : ℕ) → magnetization i = Real.tanh (effectiveField i)

def cavityFreeEnergy (N : ℕ) (β : ℝ) (H : SpinGlassHamiltonian N) (ψ : CavityField N) : ℝ :=
  Real.log (∑ s : ℕ → ℝ, Real.exp (-β * H.hamiltonian s)) -
  ∑ i, ψ.effectiveField i * ψ.magnetization i + (1 / 2) * ∑ i, ∑ j ≠ i, β * (H.couplingDistribution (i, j)) * ψ.magnetization i * ψ.magnetization j

end DynamicsDisorderedSystemsRandomIsingFoundationCanonicalLaneLean
end HautevilleHouse