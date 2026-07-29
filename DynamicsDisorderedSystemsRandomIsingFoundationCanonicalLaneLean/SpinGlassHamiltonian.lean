import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsDisorderedSystemsRandomIsingFoundationCanonicalLaneLean

structure SpinGlassHamiltonian (N : ℕ) where
  bonds : List (ℕ × ℕ × ℝ)
  externalField : List ℝ
  couplingDistribution : (ℕ × ℕ) → ℝ
  hamiltonian : (ℕ → ℝ) → ℝ
  hamiltonianDefined : hamiltonian = λ σ =>
    (List.foldl (λ acc (i, j, J) => acc + J * σ i * σ j) 0 bonds) +
    (List.foldl (λ acc (i, hi) => acc + hi * σ i) 0 (List.enum externalField))

def spinGlassEnergy (N : ℕ) (H : SpinGlassHamiltonian N) (σ : ℕ → ℝ) : ℝ :=
  H.hamiltonian σ

end DynamicsDisorderedSystemsRandomIsingFoundationCanonicalLaneLean
end HautevilleHouse