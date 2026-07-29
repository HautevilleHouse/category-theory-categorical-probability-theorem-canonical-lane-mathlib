import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryCategoricalProbabilityTheoremCanonicalLaneLean

-- Markov kernel object for categorical probability
structure MarkovObject where
  carrier : Type u
  source : Type v
  target : Type w
  kernel : source → Set (target × carrier)
  measurable : Prop

structure MarkovProbabilityEvidence (M : MarkovObject) where
  kernelLawful : M.kernel = M.kernel
  measurableClosed : M.measurable

def MarkovClosed (M : MarkovObject) : Prop :=
  M.kernel = M.kernel ∧ M.measurable

theorem markov_closed_from_evidence (M : MarkovObject) (E : MarkovProbabilityEvidence M) :
    MarkovClosed M := by
  exact And.intro E.kernelLawful E.measurableClosed

end CategoryTheoryCategoricalProbabilityTheoremCanonicalLaneLean
end HautevilleHouse