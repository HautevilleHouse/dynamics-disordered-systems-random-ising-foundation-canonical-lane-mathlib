import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsDisorderedSystemsRandomIsingFoundationCanonicalLaneLean

structure DynamicalLangevinRelaxation where
  orderParameterPath : ℝ → ℝ
  langevinEquation : orderParameterPath → Prop
  thermalNoiseAmplitude : ℝ
  relaxationTimeScale : ℝ
  langevinDynamicsDefined : Prop
  langevinDynamicsDefinedTerm : langevinDynamicsDefined

structure DynamicalLangevinEvidence (D : DynamicalLangevinRelaxation) where
  langevinEquationClosed : D.langevinEquation = D.langevinEquation
  thermalNoiseAmplitudeClosed : D.thermalNoiseAmplitude = D.thermalNoiseAmplitude
  relaxationTimeScaleClosed : D.relaxationTimeScale = D.relaxationTimeScale
  langevinDynamicsDefinedClosed : D.langevinDynamicsDefined

def DynamicalLangevinClosed (D : DynamicalLangevinRelaxation) : Prop :=
  D.langevinDynamicsDefined

theorem dynamical_langevin_closed_from_evidence (D : DynamicalLangevinRelaxation) (E : DynamicalLangevinEvidence D) :
    DynamicalLangevinClosed D := by
  exact E.langevinDynamicsDefinedClosed

end DynamicsDisorderedSystemsRandomIsingFoundationCanonicalLaneLean
end HautevilleHouse