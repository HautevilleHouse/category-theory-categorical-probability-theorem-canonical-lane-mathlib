import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryCategoricalProbabilityTheoremCanonicalLaneLean

structure MarkovCategoryPackage where
  object : Type u
  morphism : object → object → Type v
  identity : ∀ A : object, morphism A A
  composition : ∀ A B C : object, morphism A B → morphism B C → morphism A C
  identityLaw : Prop
  associativity : Prop
  copyMap : ∀ A : object, morphism A (A ⊗ A : object)
  discardMap : ∀ A : object, morphism A I
  markovAxioms : Prop

structure MarkovCategoryEvidence (M : MarkovCategoryPackage) where
  identityLawClosed : M.identityLaw
  associativityClosed : M.associativity
  markovAxiomsClosed : M.markovAxioms

def MarkovCategoryClosed (M : MarkovCategoryPackage) : Prop :=
  M.identityLaw ∧ M.associativity ∧ M.markovAxioms

theorem markov_category_closed_from_evidence (M : MarkovCategoryPackage)
    (E : MarkovCategoryEvidence M) : MarkovCategoryClosed M := by
  exact And.intro E.identityLawClosed
    (And.intro E.associativityClosed E.markovAxiomsClosed)

end CategoryTheoryCategoricalProbabilityTheoremCanonicalLaneLean
end HautevilleHouse