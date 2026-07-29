import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryCategoricalProbabilityTheoremCanonicalLaneLean

structure MorphismClosurePackage where
  source : Type u
  target : Type v
  identity : source → target
  composition : (target → target) → (source → target) → source → target
  associativity : Prop
  identityLeft : Prop
  identityRight : Prop
  associativityClosed : associativity
  identityLeftClosed : identityLeft
  identityRightClosed : identityRight

structure MorphismClosureEvidence (M : MorphismClosurePackage) where
  associativityClosed : M.associativity
  identityLeftClosed : M.identityLeft
  identityRightClosed : M.identityRight

def MorphismClosureClosed (M : MorphismClosurePackage) : Prop :=
  M.associativity ∧ M.identityLeft ∧ M.identityRight

theorem morphism_closure_closed_from_evidence (M : MorphismClosurePackage)
    (E : MorphismClosureEvidence M) : MorphismClosureClosed M := by
  exact And.intro E.associativityClosed (And.intro E.identityLeftClosed E.identityRightClosed)

end CategoryTheoryCategoricalProbabilityTheoremCanonicalLaneLean
end HautevilleHouse