import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsDisorderedSystemsRandomIsingFoundationCanonicalLaneLean

structure SherringtonKirkpatrickMeanField where
  spinCount : ℕ
  interactionMatrix : Matrix (Fin spinCount) (Fin spinCount) ℝ
  meanFieldEquation : Prop
  selfConsistency : Prop
  skModelDefined : Prop
  skModelDefinedTerm : skModelDefined

structure SherringtonKirkpatrickEvidence (S : SherringtonKirkpatrickMeanField) where
  meanFieldEquationClosed : S.meanFieldEquation
  selfConsistencyClosed : S.selfConsistency
  skModelDefinedClosed : S.skModelDefined

def SherringtonKirkpatrickClosed (S : SherringtonKirkpatrickMeanField) : Prop :=
  S.meanFieldEquation ∧ S.selfConsistency ∧ S.skModelDefined

theorem sherrington_kirkpatrick_closed_from_evidence (S : SherringtonKirkpatrickMeanField) (E : SherringtonKirkpatrickEvidence S) :
    SherringtonKirkpatrickClosed S := by
  exact And.intro E.meanFieldEquationClosed
    (And.intro E.selfConsistencyClosed E.skModelDefinedClosed)

end DynamicsDisorderedSystemsRandomIsingFoundationCanonicalLaneLean
end HautevilleHouse