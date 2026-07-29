import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryCategoricalProbabilityTheoremCanonicalLaneLean

structure GiryMonadPackage where
  functor : Type u → Type v
  unit : A → functor A
  bind : functor A → (A → functor B) → functor B
  leftIdentity : Prop
  rightIdentity : Prop
  associativity : Prop
  leftIdentityClosed : leftIdentity
  rightIdentityClosed : rightIdentity
  associativityClosed : associativity

structure GiryMonadEvidence (G : GiryMonadPackage) where
  leftIdentityClosed : G.leftIdentity
  rightIdentityClosed : G.rightIdentity
  associativityClosed : G.associativity

def GiryMonadClosed (G : GiryMonadPackage) : Prop :=
  G.leftIdentity ∧ G.rightIdentity ∧ G.associativity

theorem giry_monad_closed_from_evidence (G : GiryMonadPackage)
    (E : GiryMonadEvidence G) : GiryMonadClosed G := by
  exact And.intro E.leftIdentityClosed (And.intro E.rightIdentityClosed E.associativityClosed)

end CategoryTheoryCategoricalProbabilityTheoremCanonicalLaneLean
end HautevilleHouse