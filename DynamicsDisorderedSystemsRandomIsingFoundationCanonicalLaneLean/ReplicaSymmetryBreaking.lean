import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsDisorderedSystemsRandomIsingFoundationCanonicalLaneLean

structure ReplicaSymmetryBreaking (H : SpinGlassHamiltonian) where
  replicaNumber : ℕ
  overlapMatrix : Matrix (Fin replicaNumber) (Fin replicaNumber) ℝ
  parisiOrderParameter : ℝ → ℝ
  freeEnergyFunctional : ℝ
  rsbAnsatz : Prop
  hierarchicalStructure : Prop

structure RSBEvidence {H : SpinGlassHamiltonian} (R : ReplicaSymmetryBreaking H) where
  overlapMatrixSymmetric : ∀ a b, R.overlapMatrix a b = R.overlapMatrix b a
  parisiFunctionMonotonic : Monotone R.parisiOrderParameter
  freeEnergyFinite : R.freeEnergyFunctional < ∞
  rsbAnsatzClosed : R.rsbAnsatz
  hierarchicalStructureClosed : R.hierarchicalStructure

def RSBClosed (R : ReplicaSymmetryBreaking H) : Prop :=
  R.rsbAnsatz ∧ R.hierarchicalStructure ∧
  (∀ a b, R.overlapMatrix a b = R.overlapMatrix b a) ∧
  Monotone R.parisiOrderParameter

theorem rsb_closed_from_evidence {H : SpinGlassHamiltonian} (R : ReplicaSymmetryBreaking H) (E : RSBEvidence R) :
    RSBClosed R :=
  And.intro E.rsbAnsatzClosed (And.intro E.hierarchicalStructureClosed (And.intro E.overlapMatrixSymmetric E.parisiFunctionMonotonic))

end DynamicsDisorderedSystemsRandomIsingFoundationCanonicalLaneLean
end HautevilleHouse