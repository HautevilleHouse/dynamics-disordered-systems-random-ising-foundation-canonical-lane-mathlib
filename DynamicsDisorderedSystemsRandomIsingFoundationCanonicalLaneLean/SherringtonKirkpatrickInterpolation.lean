import DynamicsDisorderedSystemsRandomIsingFoundationCanonicalLaneLean.GaussianProcessParametric

/-!
# Sherrington–Kirkpatrick Interpolation Package
-/

namespace HautevilleHouse
namespace DynamicsDisorderedSystemsRandomIsingFoundationCanonicalLaneLean

structure SKDisorderCouplingPackage where
  interactionVariance : ℝ
  externalFieldMean : ℝ
  cavityFieldDistribution : Type u
  disorderCouplingMatrix : Type v

structure SKInterpolationPackage {K : SKDisorderCouplingPackage}
    (G : GaussianProcessParametricPackage K) where
  parisiFunctional : Type u
  replicaOverlapMatrix : Type v
  interpolationIdentity : Prop
  overlapConcentration : Prop
  parisiEquation : Prop

structure SKInterpolationEvidence {K : SKDisorderCouplingPackage}
    {G : GaussianProcessParametricPackage K} (I : SKInterpolationPackage G) where
  interpolationIdentityClosed : I.interpolationIdentity
  overlapConcentrationClosed : I.overlapConcentration
  parisiEquationClosed : I.parisiEquation

def SKInterpolationClosed {K : SKDisorderCouplingPackage}
    {G : GaussianProcessParametricPackage K} (I : SKInterpolationPackage G) : Prop :=
  I.interpolationIdentity ∧ I.overlapConcentration ∧ I.parisiEquation

theorem sk_interpolation_closed_from_evidence
    {K : SKDisorderCouplingPackage} {G : GaussianProcessParametricPackage K}
    (I : SKInterpolationPackage G) (E : SKInterpolationEvidence I) :
    SKInterpolationClosed I := by
  exact And.intro E.interpolationIdentityClosed
    (And.intro E.overlapConcentrationClosed E.parisiEquationClosed)

end DynamicsDisorderedSystemsRandomIsingFoundationCanonicalLaneLean
end HautevilleHouse