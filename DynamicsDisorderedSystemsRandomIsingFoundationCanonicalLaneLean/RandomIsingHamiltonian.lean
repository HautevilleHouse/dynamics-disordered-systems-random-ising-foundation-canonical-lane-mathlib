import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsDisorderedSystemsRandomIsingFoundationCanonicalLaneLean

structure RandomIsingHamiltonian where
  lattice : Type u
  spinConfiguration : lattice → { -1, 1 }
  couplingMatrix : lattice × lattice → ℝ
  externalField : lattice → ℝ
  hamiltonianValue : (lattice → { -1, 1 }) → ℝ
  hamiltonianDefined : hamiltonianValue = λ σ => -∑_{i,j} couplingMatrix(i,j) * σ(i) * σ(j) - ∑_i externalField(i) * σ(i)
  finiteVolumeApproximation : ℕ → Prop
  thermodynamicLimit : Prop
  hamiltonianDefinedTerm : hamiltonianDefined

structure RandomIsingHamiltonianEvidence (H : RandomIsingHamiltonian) where
  finiteVolumeApproximationClosed : H.finiteVolumeApproximation 1
  thermodynamicLimitClosed : H.thermodynamicLimit

def RandomIsingHamiltonianClosed (H : RandomIsingHamiltonian) : Prop :=
  H.hamiltonianDefined ∧ H.finiteVolumeApproximation 1 ∧ H.thermodynamicLimit

theorem random_ising_hamiltonian_closed_from_evidence
    (H : RandomIsingHamiltonian) (E : RandomIsingHamiltonianEvidence H) :
    RandomIsingHamiltonianClosed H := by
  exact And.intro H.hamiltonianDefinedTerm
    (And.intro E.finiteVolumeApproximationClosed E.thermodynamicLimitClosed)

end DynamicsDisorderedSystemsRandomIsingFoundationCanonicalLaneLean
end HautevilleHouse