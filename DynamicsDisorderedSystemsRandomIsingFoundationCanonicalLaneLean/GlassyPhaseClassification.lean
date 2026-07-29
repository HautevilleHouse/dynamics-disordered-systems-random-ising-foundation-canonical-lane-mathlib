import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsDisorderedSystemsRandomIsingFoundationCanonicalLaneLean

structure GlassyPhaseClassification where
  phaseBoundary : Prop
  spinGlassOrderParameter : Prop
  replicaSymmetryBreaking : Prop
  phaseClassified : Prop
  phaseClassifiedTerm : phaseClassified

structure GlassyPhaseClassificationEvidence (G : GlassyPhaseClassification) where
  phaseBoundaryClosed : G.phaseBoundary
  spinGlassOrderParameterClosed : G.spinGlassOrderParameter
  replicaSymmetryBreakingClosed : G.replicaSymmetryBreaking
  phaseClassifiedClosed : G.phaseClassified

def GlassyPhaseClassificationClosed (G : GlassyPhaseClassification) : Prop :=
  G.phaseBoundary ∧ G.spinGlassOrderParameter ∧ G.replicaSymmetryBreaking ∧ G.phaseClassified

theorem glassy_phase_classification_closed_from_evidence (G : GlassyPhaseClassification) (E : GlassyPhaseClassificationEvidence G) :
    GlassyPhaseClassificationClosed G := by
  exact And.intro E.phaseBoundaryClosed
    (And.intro E.spinGlassOrderParameterClosed
      (And.intro E.replicaSymmetryBreakingClosed E.phaseClassifiedClosed))

end DynamicsDisorderedSystemsRandomIsingFoundationCanonicalLaneLean
end HautevilleHouse