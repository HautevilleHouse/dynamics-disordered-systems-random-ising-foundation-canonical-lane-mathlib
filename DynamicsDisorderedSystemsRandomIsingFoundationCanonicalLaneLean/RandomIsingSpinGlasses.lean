import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsDisorderedSystemsRandomIsingFoundation

structure RandomIsingSpinGlassPackage where
  latticeDimension : Nat
  spinType : Type u
  randomCouplings : Prop
  magneticField : Prop
  hamiltonianDefined : Prop
  quenchedDisorder : Prop
  thermodynamicLimit : Prop

structure RandomIsingSpinGlassEvidence (G : RandomIsingSpinGlassPackage) where
  randomCouplingsClosed : G.randomCouplings
  hamiltonianDefinedClosed : G.hamiltonianDefined
  quenchedDisorderClosed : G.quenchedDisorder
  thermodynamicLimitClosed : G.thermodynamicLimit

def RandomIsingSpinGlassClosed (G : RandomIsingSpinGlassPackage) : Prop :=
  G.randomCouplings ∧ G.hamiltonianDefined ∧ G.quenchedDisorder ∧ G.thermodynamicLimit

theorem random_ising_spin_glass_closed_from_evidence
    (G : RandomIsingSpinGlassPackage) (E : RandomIsingSpinGlassEvidence G) :
    RandomIsingSpinGlassClosed G := by
  exact And.intro E.randomCouplingsClosed
    (And.intro E.hamiltonianDefinedClosed
      (And.intro E.quenchedDisorderClosed E.thermodynamicLimitClosed))

end DynamicsDisorderedSystemsRandomIsingFoundation
end HautevilleHouse