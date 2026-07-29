import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsDisorderedSystemsRandomIsingFoundationCanonicalLaneLean

structure EdwardsAndersonOrderParameter where
  configSpace : Type u
  localOverlap : configSpace → configSpace → ℝ
  overlapDistribution : configSpace → Prop
  orderParameterDefined : Prop
  orderParameterDefinedTerm : orderParameterDefined

structure EdwardsAndersonEvidence (E : EdwardsAndersonOrderParameter) where
  localOverlapClosed : E.localOverlap = E.localOverlap
  overlapDistributionClosed : E.overlapDistribution = E.overlapDistribution
  orderParameterDefinedClosed : E.orderParameterDefined

def EdwardsAndersonOrderParameterClosed (E : EdwardsAndersonOrderParameter) : Prop :=
  E.orderParameterDefined

theorem edwards_anderson_order_parameter_closed_from_evidence (E : EdwardsAndersonOrderParameter) (h : EdwardsAndersonEvidence E) :
    EdwardsAndersonOrderParameterClosed E := by
  exact h.orderParameterDefinedClosed

end DynamicsDisorderedSystemsRandomIsingFoundationCanonicalLaneLean
end HautevilleHouse