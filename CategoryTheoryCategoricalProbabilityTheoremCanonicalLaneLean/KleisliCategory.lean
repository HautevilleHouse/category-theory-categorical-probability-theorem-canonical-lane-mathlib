import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryCategoricalProbabilityTheoremCanonicalLaneLean

structure KleisliCategoryPackage (M : Type u → Type v) [Monad M] where
  object : Type u
  morphism : Type u → Type v
  composition : Prop
  identityLaw : Prop
  associativity : Prop

structure KleisliCategoryEvidence (M : Type u → Type v) [Monad M]
    (K : KleisliCategoryPackage M) where
  compositionClosed : K.composition
  identityLawClosed : K.identityLaw
  associativityClosed : K.associativity

def KleisliCategoryClosed (M : Type u → Type v) [Monad M]
    (K : KleisliCategoryPackage M) : Prop :=
  K.composition ∧ K.identityLaw ∧ K.associativity

theorem kleisli_category_closed_from_evidence (M : Type u → Type v) [Monad M]
    (K : KleisliCategoryPackage M) (E : KleisliCategoryEvidence M K) :
    KleisliCategoryClosed M K := by
  exact And.intro E.compositionClosed
    (And.intro E.identityLawClosed E.associativityClosed)

end CategoryTheoryCategoricalProbabilityTheoremCanonicalLaneLean
end HautevilleHouse