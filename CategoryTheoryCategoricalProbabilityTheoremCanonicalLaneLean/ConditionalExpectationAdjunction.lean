import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryCategoricalProbabilityTheoremCanonicalLaneLean

structure ConditionalExpectationAdjunctionPackage where
  sourceCategory : Type u
  targetCategory : Type v
  leftAdjoint : Type u → Type v
  rightAdjoint : Type v → Type u
  adjunctionIso : Prop
  conditionalExpectationFormula : Prop

structure ConditionalExpectationAdjunctionEvidence
    (C : ConditionalExpectationAdjunctionPackage) where
  adjunctionIsoClosed : C.adjunctionIso
  conditionalExpectationFormulaClosed : C.conditionalExpectationFormula

def ConditionalExpectationAdjunctionClosed (C : ConditionalExpectationAdjunctionPackage) : Prop :=
  C.adjunctionIso ∧ C.conditionalExpectationFormula

theorem conditional_expectation_adjunction_closed_from_evidence
    (C : ConditionalExpectationAdjunctionPackage)
    (E : ConditionalExpectationAdjunctionEvidence C) :
    ConditionalExpectationAdjunctionClosed C := by
  exact And.intro E.adjunctionIsoClosed E.conditionalExpectationFormulaClosed

end CategoryTheoryCategoricalProbabilityTheoremCanonicalLaneLean
end HautevilleHouse