import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsDisorderedSystemsRandomIsingFoundationCanonicalLaneLean

structure DisorderAveraging {H : RandomIsingHamiltonian} {D : SpinGlassDynamics H} where
  disorderRealization : Type u
  sampleSpace : disorderRealization → Prop
  empiricalMeasure : (disorderRealization → ℝ) → ℝ
  selfAveragingProperty : ∀ f : (disorderRealization → ℝ), empiricalMeasure(λ r => f(r)^2) - (empiricalMeasure(λ r => f(r)))^2 → 0
  annealedAverage : (H.lattice → { -1, 1 }) → ℝ
  annealedAverageTerm : annealedAverage = λ σ => empiricalMeasure(λ r => D.dynamicOrderParameter σ)
  selfAveragingPropertyTerm : selfAveragingProperty

structure DisorderAveragingEvidence {H : RandomIsingHamiltonian} {D : SpinGlassDynamics H}
    (A : DisorderAveraging H D) where
  selfAveragingPropertyClosed : A.selfAveragingProperty (λ r => D.dynamicOrderParameter)
  annealedAverageMatch : A.annealedAverage = λ σ => A.empiricalMeasure(λ r => D.dynamicOrderParameter σ)

def DisorderAveragingClosed {H : RandomIsingHamiltonian} {D : SpinGlassDynamics H}
    (A : DisorderAveraging H D) : Prop :=
  A.selfAveragingProperty (λ r => D.dynamicOrderParameter) ∧
  A.annealedAverage = λ σ => A.empiricalMeasure(λ r => D.dynamicOrderParameter σ)

theorem disorder_averaging_closed_from_evidence
    {H : RandomIsingHamiltonian} {D : SpinGlassDynamics H}
    (A : DisorderAveraging H D) (E : DisorderAveragingEvidence A) :
    DisorderAveragingClosed A := by
  exact And.intro E.selfAveragingPropertyClosed E.annealedAverageMatch

end DynamicsDisorderedSystemsRandomIsingFoundationCanonicalLaneLean
end HautevilleHouse