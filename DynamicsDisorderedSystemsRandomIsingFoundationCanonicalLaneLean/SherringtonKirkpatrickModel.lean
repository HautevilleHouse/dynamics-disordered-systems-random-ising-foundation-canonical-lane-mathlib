import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsDisorderedSystemsRandomIsingFoundationCanonicalLaneLean

structure SKModelParameters (N : ℕ) where
  mean : ℝ
  variance : ℝ
  couplings : (ℕ × ℕ) → ℝ
  meanField : ℝ
  parisiParameter : ℝ

def SKHamiltonian (N : ℕ) (θ : SKModelParameters N) (σ : ℕ → ℝ) : ℝ :=
  (θ.mean / (2 * N)) * (∑ i in Finset.range N, σ i) ^ 2 +
  (θ.variance / (2 * N)) * ∑ i in Finset.range N, ∑ j in Finset.range N, θ.couplings (i, j) * σ i * σ j

end DynamicsDisorderedSystemsRandomIsingFoundationCanonicalLaneLean
end HautevilleHouse