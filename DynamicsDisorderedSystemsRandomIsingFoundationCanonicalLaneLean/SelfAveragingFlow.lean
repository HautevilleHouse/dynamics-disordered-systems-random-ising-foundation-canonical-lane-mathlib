import DynamicsDisorderedSystemsRandomIsingFoundationCanonicalLaneLean.SKInterpolation

/-!
# Self-Averaging Flow Package
-/

namespace HautevilleHouse
namespace DynamicsDisorderedSystemsRandomIsingFoundationCanonicalLaneLean

structure SelfAveragingFlowPackage {K : SKDisorderCouplingPackage}
    (I : SKInterpolationPackage K) where
  freeEnergyDensity : Type u
  annealedQuenchedInequality : Prop
  noReplicaSymmetryBreaking : Prop
  fluctuationControl : Prop

structure SelfAveragingFlowEvidence {K : SKDisorderCouplingPackage}
    {I : SKInterpolationPackage K} (S : SelfAveragingFlowPackage I) where
  annealedQuenchedInequalityClosed : S.annealedQuenchedInequality
  noReplicaSymmetryBreakingClosed : S.noReplicaSymmetryBreaking
  fluctuationControlClosed : S.fluctuationControl

def SelfAveragingFlowClosed {K : SKDisorderCouplingPackage}
    {I : SKInterpolationPackage K} (S : SelfAveragingFlowPackage I) : Prop :=
  S.annealedQuenchedInequality ∧ S.noReplicaSymmetryBreaking ∧
  S.fluctuationControl

theorem self_averaging_flow_closed_from_evidence
    {K : SKDisorderCouplingPackage} {I : SKInterpolationPackage K}
    (S : SelfAveragingFlowPackage I) (E : SelfAveragingFlowEvidence S) :
    SelfAveragingFlowClosed S := by
  exact And.intro E.annealedQuenchedInequalityClosed
    (And.intro E.noReplicaSymmetryBreakingClosed E.fluctuationControlClosed)

end DynamicsDisorderedSystemsRandomIsingFoundationCanonicalLaneLean
end HautevilleHouse