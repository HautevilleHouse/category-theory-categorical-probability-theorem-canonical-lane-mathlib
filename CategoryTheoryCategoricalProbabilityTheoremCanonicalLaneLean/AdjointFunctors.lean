import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryCategoricalProbabilityTheoremCanonicalLaneLean

structure AdjointFunctorsPackage where
  leftAdjoint : Type u → Type v
  rightAdjoint : Type u → Type v
  unit : ∀ (A : Type u), A → rightAdjoint (leftAdjoint A)
  counit : ∀ (B : Type u), leftAdjoint (rightAdjoint B) → B
  triangleIdentities : Prop
  unitNaturality : Prop
  counitNaturality : Prop
  triangleIdentitiesClosed : triangleIdentities
  unitNaturalityClosed : unitNaturality
  counitNaturalityClosed : counitNaturality

structure AdjointFunctorsEvidence (A : AdjointFunctorsPackage) where
  triangleIdentitiesClosed : A.triangleIdentities
  unitNaturalityClosed : A.unitNaturality
  counitNaturalityClosed : A.counitNaturality

def AdjointFunctorsClosed (A : AdjointFunctorsPackage) : Prop :=
  A.triangleIdentities ∧ A.unitNaturality ∧ A.counitNaturality

theorem adjoint_functors_closed_from_evidence (A : AdjointFunctorsPackage)
    (E : AdjointFunctorsEvidence A) : AdjointFunctorsClosed A := by
  exact And.intro E.triangleIdentitiesClosed (And.intro E.unitNaturalityClosed E.counitNaturalityClosed)

end CategoryTheoryCategoricalProbabilityTheoremCanonicalLaneLean
end HautevilleHouse