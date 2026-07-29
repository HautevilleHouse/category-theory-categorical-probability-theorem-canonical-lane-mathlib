import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoryTheoryCategoricalProbabilityTheoremCanonicalLaneLean.CategoryTheoreticObjects

namespace HautevilleHouse
namespace CategoryTheoryCategoricalProbabilityTheoremCanonicalLaneLean

structure CategoryProbPackage (O : CategoryAdmittedObject) where
  markovKernel : Type u
  probabilityMeasure : Type v
  conditionalExpectation : Type w
  disintegrate : Prop
  fubini : Prop
  independence : Prop

def CategoryProbPackageClosed (P : CategoryProbPackage) : Prop :=
  P.disintegrate ∧ P.fubini ∧ P.independence

end CategoryTheoryCategoricalProbabilityTheoremCanonicalLaneLean
end HautevilleHouse
