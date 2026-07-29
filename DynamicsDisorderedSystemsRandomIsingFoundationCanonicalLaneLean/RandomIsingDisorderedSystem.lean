import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsDisorderedSystemsRandomIsingFoundationCanonicalLaneLean

structure DisorderedSpinConfiguration where
  sites : Type u
  spinField : sites → ℝ
  siteLabels : List (sites × String)
  disorderCouplings : sites → sites → ℝ
  pinnedDisorderRealization : Prop
  pinnedDisorderRealizationTerm : pinnedDisorderRealization

structure RandomIsingHamiltonian where
  config : DisorderedSpinConfiguration
  exchangeInteractions : config.sites → config.sites → ℝ
  externalField : config.sites → ℝ
  couplingSignBimodal : Prop
  hamiltonianDefined : Prop
  hamiltonianDefinedTerm : hamiltonianDefined

def RandomIsingHamiltonianClosed (H : RandomIsingHamiltonian) : Prop :=
  H.hamiltonianDefined ∧ H.config.pinnedDisorderRealization

theorem random_ising_hamiltonian_closed_from_evidence (H : RandomIsingHamiltonian) (hPinned : H.config.pinnedDisorderRealization) (hHam : H.hamiltonianDefined) :
    RandomIsingHamiltonianClosed H := by
  exact And.intro hHam hPinned

end DynamicsDisorderedSystemsRandomIsingFoundationCanonicalLaneLean
end HautevilleHouse