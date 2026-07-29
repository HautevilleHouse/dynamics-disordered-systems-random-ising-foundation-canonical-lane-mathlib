import DynamicsDisorderedSystemsRandomIsingFoundationCanonicalLaneLean.GateLemmasRandomIsing

namespace HautevilleHouse
namespace DynamicsDisorderedSystemsRandomIsingFoundationCanonicalLaneLean

def ConstrainedRandomIsingClosure (A : AdmissibleRandomIsingClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_random_ising_endgame (A : AdmissibleRandomIsingClass) :
    ConstrainedRandomIsingClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end DynamicsDisorderedSystemsRandomIsingFoundationCanonicalLaneLean
end HautevilleHouse