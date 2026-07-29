import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsDisorderedSystemsRandomIsingFoundation

structure EdwardsAndersonOrderParameter where
  latticeDimension : Nat
  spinOverlap : Type u
  qEA : Type v
  orderParameterDefined : Prop
  ergodicityBreaking : Prop
  fluctuationDissipation : Prop
  interfaceFreeEnergy : Prop

structure EdwardsAndersonOrderEvidence (Ea : EdwardsAndersonOrderParameter) where
  orderParameterDefinedClosed : Ea.orderParameterDefined
  ergodicityBreakingClosed : Ea.ergodicityBreaking
  fluctuationDissipationClosed : Ea.fluctuationDissipation
  interfaceFreeEnergyClosed : Ea.interfaceFreeEnergy

def EdwardsAndersonOrderClosed (Ea : EdwardsAndersonOrderParameter) : Prop :=
  Ea.orderParameterDefined ∧ Ea.ergodicityBreaking ∧ Ea.fluctuationDissipation ∧ Ea.interfaceFreeEnergy

theorem edwards_anderson_order_closed_from_evidence
    (Ea : EdwardsAndersonOrderParameter) (E : EdwardsAndersonOrderEvidence Ea) :
    EdwardsAndersonOrderClosed Ea := by
  exact And.intro E.orderParameterDefinedClosed
    (And.intro E.ergodicityBreakingClosed
      (And.intro E.fluctuationDissipationClosed E.interfaceFreeEnergyClosed))

end DynamicsDisorderedSystemsRandomIsingFoundation
end HautevilleHouse