import canonicalLaneMathlib.AdmissibleClass
import CategoryTheoryCategoricalProbabilityTheoremCanonicalLaneLean.CategoryTheoreticProbabilityMonad

namespace HautevilleHouse
namespace CategoryTheoryCategoricalProbabilityTheoremCanonicalLaneLean

structure BayesianInversionPackage {C : Type u} [Category.{v} C] (M : ProbabilityMonad C) where
  prior : (X : C) → (X ⟶ M.carrier X)
  likelihood : (X Y : C) → (X ⟶ M.carrier Y)
  posterior : (X Y : C) → (M.carrier Y ⟶ M.carrier X)
  inversionCondition : (X Y : C) → M.bind Y X (posterior X Y) ∘ likelihood X Y = prior X

structure BayesianInversionEvidence {C : Type u} [Category.{v} C] {M : ProbabilityMonad C}
    (B : BayesianInversionPackage M) where
  inversionConditionClosed : (X Y : C) → B.inversionCondition X Y

def BayesianInversionClosed {C : Type u} [Category.{v} C] {M : ProbabilityMonad C}
    (B : BayesianInversionPackage M) : Prop :=
  ∀ (X Y : C), B.inversionCondition X Y

theorem bayesian_inversion_closed_from_evidence {C : Type u} [Category.{v} C] {M : ProbabilityMonad C}
    (B : BayesianInversionPackage M) (E : BayesianInversionEvidence B) : BayesianInversionClosed B := by
  intro X Y
  exact E.inversionConditionClosed X Y

end HautevilleHouse.CategoryTheoryCategoricalProbabilityTheoremCanonicalLaneLean
end HautevilleHouse