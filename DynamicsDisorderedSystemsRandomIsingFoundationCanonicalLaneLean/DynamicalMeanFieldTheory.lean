import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsDisorderedSystemsRandomIsingFoundationCanonicalLaneLean

structure DynamicalMeanFieldTheory (H : SpinGlassHamiltonian) where
  localSelfEnergy : ℝ → ℂ
  effectiveMedium : ℂ → ℂ
  selfConsistencyEquation : Prop
  causalityConstraint : Prop

structure DMFTEvidence {H : SpinGlassHamiltonian} (D : DynamicalMeanFieldTheory H) where
  selfConsistencyEquationClosed : D.selfConsistencyEquation
  causalityConstraintClosed : D.causalityConstraint

def DynamicalMeanFieldTheoryClosed (D : DynamicalMeanFieldTheory H) : Prop :=
  D.selfConsistencyEquation ∧ D.causalityConstraint

theorem dmft_closed_from_evidence {H : SpinGlassHamiltonian} (D : DynamicalMeanFieldTheory H) (E : DMFTEvidence D) :
    DynamicalMeanFieldTheoryClosed D :=
  And.intro E.selfConsistencyEquationClosed E.causalityConstraintClosed

end DynamicsDisorderedSystemsRandomIsingFoundationCanonicalLaneLean
end HautevilleHouse