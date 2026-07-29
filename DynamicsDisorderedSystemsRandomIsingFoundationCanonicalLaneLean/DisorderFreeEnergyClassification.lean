import DynamicsDisorderedSystemsRandomIsingFoundationCanonicalLaneLean.SelfAveragingFlow

/-!
# Disorder Free Energy Classification Package
-/

namespace HautevilleHouse
namespace DynamicsDisorderedSystemsRandomIsingFoundationCanonicalLaneLean

structure DisorderFreeEnergyClassificationPackage {K : SKDisorderCouplingPackage}
    {S : SelfAveragingFlowPackage K} (F : FreeEnergyFunctionalPackage S) where
  disorderAvgFreeEnergyFinite : Prop
  fluctuationBounds : Prop
  centralizedLimitExists : Prop
  endpointFreeEnergyMatch : Prop

structure DisorderFreeEnergyClassificationEvidence {K : SKDisorderCouplingPackage}
    {S : SelfAveragingFlowPackage K} {F : FreeEnergyFunctionalPackage S}
    (D : DisorderFreeEnergyClassificationPackage F) where
  disorderAvgFreeEnergyFiniteClosed : D.disorderAvgFreeEnergyFinite
  fluctuationBoundsClosed : D.fluctuationBounds
  centralizedLimitExistsClosed : D.centralizedLimitExists
  endpointFreeEnergyMatchClosed : D.endpointFreeEnergyMatch

def DisorderFreeEnergyClassificationClosed {K : SKDisorderCouplingPackage}
    {S : SelfAveragingFlowPackage K} {F : FreeEnergyFunctionalPackage S}
    (D : DisorderFreeEnergyClassificationPackage F) : Prop :=
  D.disorderAvgFreeEnergyFinite ∧ D.fluctuationBounds ∧
  D.centralizedLimitExists ∧ D.endpointFreeEnergyMatch

theorem disorder_free_energy_classification_closed_from_evidence
    {K : SKDisorderCouplingPackage} {S : SelfAveragingFlowPackage K}
    {F : FreeEnergyFunctionalPackage S} (D : DisorderFreeEnergyClassificationPackage F)
    (E : DisorderFreeEnergyClassificationEvidence D) :
    DisorderFreeEnergyClassificationClosed D := by
  exact And.intro E.disorderAvgFreeEnergyFiniteClosed
    (And.intro E.fluctuationBoundsClosed
      (And.intro E.centralizedLimitExistsClosed E.endpointFreeEnergyMatchClosed))

end DynamicsDisorderedSystemsRandomIsingFoundationCanonicalLaneLean
end HautevilleHouse