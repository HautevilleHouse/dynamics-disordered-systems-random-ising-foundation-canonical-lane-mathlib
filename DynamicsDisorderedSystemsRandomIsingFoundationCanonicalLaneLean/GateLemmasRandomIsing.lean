import DynamicsDisorderedSystemsRandomIsingFoundationCanonicalLaneLean.BridgeLemmasRandomIsing

namespace HautevilleHouse
namespace DynamicsDisorderedSystemsRandomIsingFoundationCanonicalLaneLean

def gateClosed (A : AdmissibleRandomIsingClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleRandomIsingClass) :
    gateClosed A := by
  exact A.gateWitness

end DynamicsDisorderedSystemsRandomIsingFoundationCanonicalLaneLean
end HautevilleHouse