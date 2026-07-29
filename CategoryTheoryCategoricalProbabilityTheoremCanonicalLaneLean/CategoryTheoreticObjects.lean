import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryCategoricalProbabilityTheoremCanonicalLaneLean

structure CategorySpace where
  carrier : Type u
  topology : TopologicalSpace carrier

structure CategoryAdmittedObject where
  space : CategorySpace
  hasFiniteLimits : Prop
  hasFiniteColimits : Prop
  endpointModel : Type
  endpointTopology : TopologicalSpace endpointModel
  isomorphicToEndpoint : Prop
  conclusion : isomorphicToEndpoint

structure CategoryEndgameState where
  object : CategoryAdmittedObject

def CategoryWitnessClosed (O : CategoryAdmittedObject) : Prop :=
  O.isomorphicToEndpoint

end CategoryTheoryCategoricalProbabilityTheoremCanonicalLaneLean
end HautevilleHouse
