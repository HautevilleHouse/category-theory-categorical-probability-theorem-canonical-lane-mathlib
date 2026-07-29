import CategoryTheoryCategoricalProbabilityTheoremCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace CategoryTheoryCategoricalProbabilityTheoremCanonicalLaneLean

structure CategoryObject where
  category : Type u
  topology : TopologicalSpace category
  monoidalStructure : Prop
  symmetricMonoidal : Prop
  markovCategory : Prop
  conclusion : markovCategory

structure CategoryAdmittedObject where
  object : CategoryObject
  endgameWitness : object.markovCategory

def CategoryWitnessClosed (O : CategoryAdmittedObject) : Prop :=
  O.object.markovCategory

end CategoryTheoryCategoricalProbabilityTheoremCanonicalLaneLean
end HautevilleHouse
