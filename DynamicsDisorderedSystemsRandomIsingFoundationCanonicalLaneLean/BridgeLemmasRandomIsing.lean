import DynamicsDisorderedSystemsRandomIsingFoundationCanonicalLaneLean.RandomIsingAdmissibleClass

namespace HautevilleHouse
namespace DynamicsDisorderedSystemsRandomIsingFoundationCanonicalLaneLean

def bridgeClosed (A : AdmissibleRandomIsingClass) : Prop :=
  IsingWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleRandomIsingClass) :
    bridgeClosed A := by
  exact A.object.isingAdmitted

end DynamicsDisorderedSystemsRandomIsingFoundationCanonicalLaneLean
end HautevilleHouse