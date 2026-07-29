import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryCategoricalProbabilityTheoremCanonicalLaneLean

structure MonadBayesianPackage where
  prior : Type u
  likelihood : Type v
  posterior : Type w
  bayesUpdate : Prop
  conditionalStructure : Prop

structure MonadBayesianEvidence (M : MonadBayesianPackage) where
  bayesUpdateClosed : M.bayesUpdate
  conditionalStructureClosed : M.conditionalStructure

def MonadBayesianClosed (M : MonadBayesianPackage) : Prop :=
  M.bayesUpdate ∧ M.conditionalStructure

theorem monad_bayesian_closed_from_evidence (M : MonadBayesianPackage)
    (E : MonadBayesianEvidence M) : MonadBayesianClosed M := by
  exact And.intro E.bayesUpdateClosed E.conditionalStructureClosed

end CategoryTheoryCategoricalProbabilityTheoremCanonicalLaneLean
end HautevilleHouse