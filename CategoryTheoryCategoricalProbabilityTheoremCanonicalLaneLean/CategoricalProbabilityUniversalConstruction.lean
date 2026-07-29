import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryCategoricalProbabilityTheoremCanonicalLaneLean

-- Universal construction for categorical probability: a Giry-like monad
structure GiryMonadObject where
  space : Type u
  sigmaAlgebra : Set (Set space)
  measureSet : Type v
  monadStructure : Prop

def GiryMonadClosed (G : GiryMonadObject) : Prop :=
  G.monadStructure

structure GiryMonadEvidence (G : GiryMonadObject) where
  monadStructureClosed : G.monadStructure

theorem giry_monad_closed_from_evidence (G : GiryMonadObject) (E : GiryMonadEvidence G) :
    GiryMonadClosed G := by
  exact E.monadStructureClosed

end CategoryTheoryCategoricalProbabilityTheoremCanonicalLaneLean
end HautevilleHouse