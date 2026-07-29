import canonicalLaneMathlib.AdmissibleClass
import CategoryTheoryCategoricalProbabilityTheoremCanonicalLaneLean.CategoryTheoreticProbabilityMonad

namespace HautevilleHouse
namespace CategoryTheoryCategoricalProbabilityTheoremCanonicalLaneLean

structure GiryMonadPackage where
  measurableSpaceCarrier : Type u → MeasurableSpace
  pushforward : ∀ {X Y : Type u} (f : X → Y) [MeasurableSpace X] [MeasurableSpace Y],
    Measure X → Measure Y
  join : ∀ (X : Type u) [MeasurableSpace X], Measure (Measure X) → Measure X
  unitLaw : ∀ (X : Type u) [MeasurableSpace X] (x : X), join X (pushforward (fun _ : Unit => x) (dirac ())) = dirac x
  bindLaw : ∀ {X Y : Type u} [MeasurableSpace X] [MeasurableSpace Y] (μ : Measure X) (f : X → Measure Y),
    join Y (pushforward f μ) = join Y (pushforward (fun x => pushforward (fun y => y) (f x)) μ)

structure GiryMonadEvidence (G : GiryMonadPackage) where
  unitLawClosed : G.unitLaw
  bindLawClosed : G.bindLaw

def GiryMonadClosed (G : GiryMonadPackage) : Prop :=
  G.unitLaw ∧ G.bindLaw

theorem giry_monad_closed_from_evidence (G : GiryMonadPackage) (E : GiryMonadEvidence G) :
    GiryMonadClosed G := by
  exact And.intro E.unitLawClosed E.bindLawClosed

end HautevilleHouse.CategoryTheoryCategoricalProbabilityTheoremCanonicalLaneLean
end HautevilleHouse