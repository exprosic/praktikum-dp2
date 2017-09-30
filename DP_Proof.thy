theory DP_Proof
  imports "./DP_CRelVS" "~~/src/HOL/Eisbach/Eisbach_Tools"
begin

term 0 (*
method dp_match uses induct simp simp\<^sub>T =
  ( rule dp_consistency.consistentDP_intro,
    rule induct,
    unfold simp\<^sub>T;
    rule dp_consistency.crel_vs_checkmem,
    unfold simp,
    ((match premises in _[transfer_rule]: _ (multi) \<Rightarrow> transfer_prover)
      | (match conclusion in _ \<Rightarrow> transfer_prover)))
*)
  thm dp_consistency.crel_vs_return
xmethod dp_step uses IH =
  (match conclusion in
    "dp_consistency.crel_vs dp R x \<langle>y\<rangle>" for dp R x y \<Rightarrow> \<open>rule dp_consistency.crel_vs_return[of R x y dp]\<close>
  | "dp_consistency.crel_vs dp R (case x"
  )

method dp_naive = (solves \<open>simp\<close>)
end