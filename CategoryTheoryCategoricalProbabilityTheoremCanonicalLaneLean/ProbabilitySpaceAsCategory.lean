import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryCategoricalProbabilityTheoremCanonicalLaneLean

structure ProbabilitySpaceCategoryPackage where
  sampleSpace : Type u
  sigmaAlgebra : Set (Set (sampleSpace : Type u))
  probabilityMeasure : (sampleSpace : Type u) → ℝ
  measurableMaps : Type v
  categoryAxioms : Prop

structure ProbabilitySpaceCategoryEvidence (P : ProbabilitySpaceCategoryPackage) where
  sigmaAlgebraClosed : P.sigmaAlgebra ≠ ∅
  probabilityMeasureClosed : ∀ x : (P.sampleSpace : Type u), P.probabilityMeasure x ≥ 0
  categoryAxiomsClosed : P.categoryAxioms

def ProbabilitySpaceCategoryClosed (P : ProbabilitySpaceCategoryPackage) : Prop :=
  P.sigmaAlgebra ≠ ∅ ∧ (∀ x : (P.sampleSpace : Type u), P.probabilityMeasure x ≥ 0) ∧ P.categoryAxioms

theorem probability_space_category_closed_from_evidence (P : ProbabilitySpaceCategoryPackage)
    (E : ProbabilitySpaceCategoryEvidence P) : ProbabilitySpaceCategoryClosed P := by
  exact And.intro E.sigmaAlgebraClosed
    (And.intro E.probabilityMeasureClosed E.categoryAxiomsClosed)

end CategoryTheoryCategoricalProbabilityTheoremCanonicalLaneLean
end HautevilleHouse