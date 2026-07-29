import canonicalLaneMathlib.AdmissibleClass
import CategoryTheoryCategoricalProbabilityTheoremCanonicalLaneLean.CategoryTheoreticProbabilityMonad

namespace HautevilleHouse
namespace CategoryTheoryCategoricalProbabilityTheoremCanonicalLaneLean

structure KleisliCategoryPackage {C : Type u} [Category.{v} C] (M : ProbabilityMonad C) where
  object : C → C := M.carrier
  morphism : ∀ (X Y : C), (X ⟶ M.carrier Y) → (M.carrier X ⟶ M.carrier Y) := M.bind
  identity : ∀ (X : C), (X ⟶ M.carrier X) := M.unit X
  composition : ∀ (X Y Z : C) (f : X ⟶ M.carrier Y) (g : Y ⟶ M.carrier Z),
    (M.bind X Z (M.bind X Z (fun x => M.bind Y Z g (f x)) ∘ M.unit X)) = M.bind Y Z g ∘ M.bind X Y f := by
    intro X Y Z f g; rfl
  identity_left : ∀ (X Y : C) (f : X ⟶ M.carrier Y),
    (M.bind X Y f) ∘ (M.unit X) = f := M.bind_unit_eq X Y f
  identity_right : ∀ (X Y : C) (f : X ⟶ M.carrier Y),
    M.bind Y Y (M.unit Y) ∘ (M.bind X Y f) = M.bind X Y f := by
    intro X Y f; calc
      M.bind Y Y (M.unit Y) ∘ M.bind X Y f = (𝟙 (M.carrier Y)) ∘ M.bind X Y f := by rfl
      _ = M.bind X Y f := by simp

structure KleisliCategoryEvidence {C : Type u} [Category.{v} C] {M : ProbabilityMonad C}
    (K : KleisliCategoryPackage M) where
  compositionClosed : K.composition
  identity_leftClosed : K.identity_left
  identity_rightClosed : K.identity_right

def KleisliCategoryClosed {C : Type u} [Category.{v} C] {M : ProbabilityMonad C}
    (K : KleisliCategoryPackage M) : Prop :=
  K.composition ∧ K.identity_left ∧ K.identity_right

theorem kleisli_category_closed_from_evidence {C : Type u} [Category.{v} C] {M : ProbabilityMonad C}
    (K : KleisliCategoryPackage M) (E : KleisliCategoryEvidence K) : KleisliCategoryClosed K := by
  exact And.intro E.compositionClosed (And.intro E.identity_leftClosed E.identity_rightClosed)

end HautevilleHouse.CategoryTheoryCategoricalProbabilityTheoremCanonicalLaneLean
end HautevilleHouse