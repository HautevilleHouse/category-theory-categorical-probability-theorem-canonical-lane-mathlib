import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryCategoricalProbabilityTheoremCanonicalLaneLean

structure CategoricalProbabilityPackage where
  markovKernel : Type u → Type v → Type w
  compositionOfKernels : (A → B) → (B → C) → (A → C)
  identityKernel : A → A
  associativity : Prop
  identityLeft : Prop
  identityRight : Prop
  fubiniTheorem : Prop
  associativityClosed : associativity
  identityLeftClosed : identityLeft
  identityRightClosed : identityRight
  fubiniTheoremClosed : fubiniTheorem

structure CategoricalProbabilityEvidence (C : CategoricalProbabilityPackage) where
  associativityClosed : C.associativity
  identityLeftClosed : C.identityLeft
  identityRightClosed : C.identityRight
  fubiniTheoremClosed : C.fubiniTheorem

def CategoricalProbabilityClosed (C : CategoricalProbabilityPackage) : Prop :=
  C.associativity ∧ C.identityLeft ∧ C.identityRight ∧ C.fubiniTheorem

theorem categorical_probability_closed_from_evidence (C : CategoricalProbabilityPackage)
    (E : CategoricalProbabilityEvidence C) : CategoricalProbabilityClosed C := by
  exact And.intro E.associativityClosed
    (And.intro E.identityLeftClosed
      (And.intro E.identityRightClosed E.fubiniTheoremClosed))

end CategoryTheoryCategoricalProbabilityTheoremCanonicalLaneLean
end HautevilleHouse