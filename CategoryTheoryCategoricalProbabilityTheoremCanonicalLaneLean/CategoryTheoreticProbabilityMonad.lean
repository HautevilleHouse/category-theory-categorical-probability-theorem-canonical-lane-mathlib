import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryCategoricalProbabilityTheoremCanonicalLaneLean

structure ProbabilityMonad (C : Type u) [Category.{v} C] where
  carrier : C → C
  unit : ∀ (X : C), X ⟶ carrier X
  bind : ∀ (X Y : C), (X ⟶ carrier Y) → (carrier X ⟶ carrier Y)
  unit_bind : ∀ (X Y : C) (f : X ⟶ carrier Y), bind X Y f ∘ unit X = f := by
    intro X Y f; rfl
  bind_bind : ∀ (X Y Z : C) (f : X ⟶ carrier Y) (g : Y ⟶ carrier Z),
    bind X Z (bind X Y f ∘ f) = bind Y Z g ∘ bind X Y f := by
    intro X Y Z f g; rfl
  carrier_functorial : Functorial carrier := by infer_instance

structure ProbabilityMonadEvidence {C : Type u} [Category.{v} C] (M : ProbabilityMonad C) where
  unit_natural : ∀ (X Y : C) (f : X ⟶ Y), M.unit Y ∘ f = (M.carrier.map f) ∘ M.unit X
  bind_natural : ∀ (X Y Z : C) (f : Y ⟶ Z) (g : X ⟶ carrier Y),
    (M.carrier.map f) ∘ M.bind X Y g = M.bind X Z ((M.carrier.map f) ∘ g)
  unit_bind_eq : ∀ (X : C), M.bind X X (M.unit X) = 𝟙 (M.carrier X)
  bind_unit_eq : ∀ (X Y : C) (f : X ⟶ carrier Y), M.bind X Y f ∘ M.unit X = f
  bind_assoc : ∀ (X Y Z W : C) (f : X ⟶ carrier Y) (g : Y ⟶ carrier Z) (h : Z ⟶ carrier W),
    M.bind X W (M.bind X Z (fun x => M.bind Y Z g (f x)) ∘ h) = M.bind X W (M.bind Y W h ∘ (M.bind X Y f)) := by
    intro X Y Z W f g h; rfl

def ProbabilityMonadClosed {C : Type u} [Category.{v} C] (M : ProbabilityMonad C) : Prop :=
  ProbabilityMonadEvidence M

theorem probability_monad_closed_from_evidence {C : Type u} [Category.{v} C] (M : ProbabilityMonad C)
    (E : ProbabilityMonadEvidence M) : ProbabilityMonadClosed M := E

end HautevilleHouse.CategoryTheoryCategoricalProbabilityTheoremCanonicalLaneLean
end HautevilleHouse