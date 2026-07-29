import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsDisorderedSystemsRandomIsingFoundationCanonicalLaneLean

structure SpinGlassDynamics {H : RandomIsingHamiltonian} where
  timeDomain : Type u
  stateSpace : (H.lattice → { -1, 1 }) → Type v
  markovTransition : (H.lattice → { -1, 1 }) → (H.lattice → { -1, 1 }) → ℝ
  detailedBalanceCondition : ∀ σ τ, H.hamiltonianValue(σ) * markovTransition(σ, τ) = H.hamiltonianValue(τ) * markovTransition(τ, σ)
  relaxationTime : ℝ
  dynamicOrderParameter : (H.lattice → { -1, 1 }) → ℝ
  detailedBalanceConditionTerm : detailedBalanceCondition

structure SpinGlassDynamicsEvidence {H : RandomIsingHamiltonian} (D : SpinGlassDynamics H) where
  relaxationTimeFinite : D.relaxationTime < ∞
  dynamicOrderParameterWellDefined : ∀ σ, D.dynamicOrderParameter σ ∈ ℝ

def SpinGlassDynamicsClosed {H : RandomIsingHamiltonian} (D : SpinGlassDynamics H) : Prop :=
  D.detailedBalanceCondition ∧ D.relaxationTime < ∞ ∧ (∀ σ, D.dynamicOrderParameter σ ∈ ℝ)

theorem spin_glass_dynamics_closed_from_evidence
    {H : RandomIsingHamiltonian} (D : SpinGlassDynamics H)
    (E : SpinGlassDynamicsEvidence D) : SpinGlassDynamicsClosed D := by
  exact And.intro D.detailedBalanceConditionTerm
    (And.intro E.relaxationTimeFinite E.dynamicOrderParameterWellDefined)

end DynamicsDisorderedSystemsRandomIsingFoundationCanonicalLaneLean
end HautevilleHouse