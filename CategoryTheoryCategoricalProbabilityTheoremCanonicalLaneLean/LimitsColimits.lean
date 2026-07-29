import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryCategoricalProbabilityTheoremCanonicalLaneLean

structure LimitsColimitsPackage where
  diagram : Type u → Type v
  limit : Type u
  colimit : Type u
  universalPropertyLimit : Prop
  universalPropertyColimit : Prop
  existenceOfLimits : Prop
  existenceOfColimits : Prop
  universalPropertyLimitClosed : universalPropertyLimit
  universalPropertyColimitClosed : universalPropertyColimit
  existenceOfLimitsClosed : existenceOfLimits
  existenceOfColimitsClosed : existenceOfColimits

structure LimitsColimitsEvidence (L : LimitsColimitsPackage) where
  universalPropertyLimitClosed : L.universalPropertyLimit
  universalPropertyColimitClosed : L.universalPropertyColimit
  existenceOfLimitsClosed : L.existenceOfLimits
  existenceOfColimitsClosed : L.existenceOfColimits

def LimitsColimitsClosed (L : LimitsColimitsPackage) : Prop :=
  L.universalPropertyLimit ∧ L.universalPropertyColimit ∧
  L.existenceOfLimits ∧ L.existenceOfColimits

theorem limits_colimits_closed_from_evidence (L : LimitsColimitsPackage)
    (E : LimitsColimitsEvidence L) : LimitsColimitsClosed L := by
  exact And.intro E.universalPropertyLimitClosed
    (And.intro E.universalPropertyColimitClosed
      (And.intro E.existenceOfLimitsClosed E.existenceOfColimitsClosed))

end CategoryTheoryCategoricalProbabilityTheoremCanonicalLaneLean
end HautevilleHouse