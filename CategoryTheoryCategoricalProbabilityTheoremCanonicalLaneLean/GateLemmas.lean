import CategoryTheoryCategoricalProbabilityTheoremCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace CategoryTheoryCategoricalProbabilityTheoremCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end CategoryTheoryCategoricalProbabilityTheoremCanonicalLaneLean
end HautevilleHouse
