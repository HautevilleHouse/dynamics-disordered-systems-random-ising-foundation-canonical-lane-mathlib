import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsDisorderedSystemsRandomIsingFoundationCanonicalLaneLean

structure RandomIsingAdmittedObject where
  spinConfigType : Type u
  disorderCouplings : Type v
  disorderSample : disorderCouplings
  freeEnergyFinite : Prop
  spinCorrelationsDecay : Prop
  magnetizationDefined : Prop
  isingAdmitted : freeEnergyFinite ∧ spinCorrelationsDecay ∧ magnetizationDefined

structure AdmissibleRandomIsingClass where
  object : RandomIsingAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedRandomIsingClosure (A : AdmissibleRandomIsingClass) : Prop :=
  IsingWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end DynamicsDisorderedSystemsRandomIsingFoundationCanonicalLaneLean
end HautevilleHouse