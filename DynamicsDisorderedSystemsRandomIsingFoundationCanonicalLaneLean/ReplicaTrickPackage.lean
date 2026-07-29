import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsDisorderedSystemsRandomIsingFoundationCanonicalLaneLean

structure ReplicaTrickPackage where
  replicaNumber : ℕ
  replicatedPartitionFunction : Prop
  annealedAverage : Prop
  quenchedDisorderAveraging : Prop
  replicaTrickValid : Prop
  replicaTrickValidTerm : replicaTrickValid

structure ReplicaTrickEvidence (R : ReplicaTrickPackage) where
  replicatedPartitionFunctionClosed : R.replicatedPartitionFunction
  annealedAverageClosed : R.annealedAverage
  quenchedDisorderAveragingClosed : R.quenchedDisorderAveraging
  replicaTrickValidClosed : R.replicaTrickValid

def ReplicaTrickClosed (R : ReplicaTrickPackage) : Prop :=
  R.replicatedPartitionFunction ∧ R.annealedAverage ∧
  R.quenchedDisorderAveraging ∧ R.replicaTrickValid

theorem replica_trick_closed_from_evidence (R : ReplicaTrickPackage) (E : ReplicaTrickEvidence R) :
    ReplicaTrickClosed R := by
  exact And.intro E.replicatedPartitionFunctionClosed
    (And.intro E.annealedAverageClosed
      (And.intro E.quenchedDisorderAveragingClosed E.replicaTrickValidClosed))

end DynamicsDisorderedSystemsRandomIsingFoundationCanonicalLaneLean
end HautevilleHouse