import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsDisorderedSystemsRandomIsingFoundation

structure GlauberDynamicsPackage where
  stateSpace : Type u
  spinFlipRates : Type v
  detailedBalance : Prop
  stationaryMeasure : Prop
  mixingTime : Prop
  disorderAveraged : Prop

structure GlauberDynamicsEvidence (D : GlauberDynamicsPackage) where
  detailedBalanceClosed : D.detailedBalance
  stationaryMeasureClosed : D.stationaryMeasure
  mixingTimeClosed : D.mixingTime
  disorderAveragedClosed : D.disorderAveraged

def GlauberDynamicsClosed (D : GlauberDynamicsPackage) : Prop :=
  D.detailedBalance ∧ D.stationaryMeasure ∧ D.mixingTime ∧ D.disorderAveraged

theorem glauber_dynamics_closed_from_evidence
    (D : GlauberDynamicsPackage) (E : GlauberDynamicsEvidence D) :
    GlauberDynamicsClosed D := by
  exact And.intro E.detailedBalanceClosed
    (And.intro E.stationaryMeasureClosed
      (And.intro E.mixingTimeClosed E.disorderAveragedClosed))

end DynamicsDisorderedSystemsRandomIsingFoundation
end HautevilleHouse