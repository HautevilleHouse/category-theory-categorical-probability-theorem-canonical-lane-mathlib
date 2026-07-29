import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryCategoricalProbabilityTheoremCanonicalLaneLean

structure YonedaEmbeddingPackage where
  functor : Type u → Type v
  naturalTransformation : (Type u → Type v) → (Type u → Type v) → Prop
  yonedaLemma : Prop
  fullFaithfulness : Prop
  yonedaLemmaClosed : yonedaLemma
  fullFaithfulnessClosed : fullFaithfulness

structure YonedaEmbeddingEvidence (Y : YonedaEmbeddingPackage) where
  yonedaLemmaClosed : Y.yonedaLemma
  fullFaithfulnessClosed : Y.fullFaithfulness

def YonedaEmbeddingClosed (Y : YonedaEmbeddingPackage) : Prop :=
  Y.yonedaLemma ∧ Y.fullFaithfulness

theorem yoneda_embedding_closed_from_evidence (Y : YonedaEmbeddingPackage)
    (E : YonedaEmbeddingEvidence Y) : YonedaEmbeddingClosed Y := by
  exact And.intro E.yonedaLemmaClosed E.fullFaithfulnessClosed

end CategoryTheoryCategoricalProbabilityTheoremCanonicalLaneLean
end HautevilleHouse