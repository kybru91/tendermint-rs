------------------------- MODULE counterexample -------------------------

EXTENDS MC4_4_faulty

(* Initial state *)

State1 ==
TRUE
(* Transition 0 to State2 *)

State2 ==
/\ Faulty = {"n2"}
/\ blockchain = 1
    :> [NextVS |-> {"n1"},
      VS |-> { "n1", "n2", "n3", "n4" },
      height |-> 1,
      lastCommit |-> {},
      time |-> 1]
  @@ 2
    :> [NextVS |-> { "n1", "n3", "n4" },
      VS |-> {"n1"},
      height |-> 2,
      lastCommit |-> { "n2", "n3", "n4" },
      time |-> 4]
  @@ 3
    :> [NextVS |-> {"n3"},
      VS |-> { "n1", "n3", "n4" },
      height |-> 3,
      lastCommit |-> {"n1"},
      time |-> 5]
  @@ 4
    :> [NextVS |-> {"n4"},
      VS |-> {"n3"},
      height |-> 4,
      lastCommit |-> { "n1", "n3", "n4" },
      time |-> 8]
  @@ 5
    :> [NextVS |-> { "n1", "n2", "n3", "n4" },
      VS |-> {"n4"},
      height |-> 5,
      lastCommit |-> {"n3"},
      time |-> 9]
/\ fetchedLightBlocks = 1
    :> [Commits |-> { "n1", "n2", "n3", "n4" },
      header |->
        [NextVS |-> {"n1"},
          VS |-> { "n1", "n2", "n3", "n4" },
          height |-> 1,
          lastCommit |-> {},
          time |-> 1]]
/\ history = 0
    :> [current |->
        [Commits |-> { "n1", "n2", "n3", "n4" },
          header |->
            [NextVS |-> {"n1"},
              VS |-> { "n1", "n2", "n3", "n4" },
              height |-> 1,
              lastCommit |-> {},
              time |-> 1]],
      now |-> 1399,
      verdict |-> "SUCCESS",
      verified |->
        [Commits |-> { "n1", "n2", "n3", "n4" },
          header |->
            [NextVS |-> {"n1"},
              VS |-> { "n1", "n2", "n3", "n4" },
              height |-> 1,
              lastCommit |-> {},
              time |-> 1]]]
/\ latestVerified = [Commits |-> { "n1", "n2", "n3", "n4" },
  header |->
    [NextVS |-> {"n1"},
      VS |-> { "n1", "n2", "n3", "n4" },
      height |-> 1,
      lastCommit |-> {},
      time |-> 1]]
/\ lightBlockStatus = 1 :> "StateVerified"
/\ nextHeight = 4
/\ now = 1399
/\ nprobes = 0
/\ prevCurrent = [Commits |-> { "n1", "n2", "n3", "n4" },
  header |->
    [NextVS |-> {"n1"},
      VS |-> { "n1", "n2", "n3", "n4" },
      height |-> 1,
      lastCommit |-> {},
      time |-> 1]]
/\ prevNow = 1399
/\ prevVerdict = "SUCCESS"
/\ prevVerified = [Commits |-> { "n1", "n2", "n3", "n4" },
  header |->
    [NextVS |-> {"n1"},
      VS |-> { "n1", "n2", "n3", "n4" },
      height |-> 1,
      lastCommit |-> {},
      time |-> 1]]
/\ state = "working"

(* Transition 1 to State3 *)

State3 ==
/\ Faulty = {"n2"}
/\ blockchain = 1
    :> [NextVS |-> {"n1"},
      VS |-> { "n1", "n2", "n3", "n4" },
      height |-> 1,
      lastCommit |-> {},
      time |-> 1]
  @@ 2
    :> [NextVS |-> { "n1", "n3", "n4" },
      VS |-> {"n1"},
      height |-> 2,
      lastCommit |-> { "n2", "n3", "n4" },
      time |-> 4]
  @@ 3
    :> [NextVS |-> {"n3"},
      VS |-> { "n1", "n3", "n4" },
      height |-> 3,
      lastCommit |-> {"n1"},
      time |-> 5]
  @@ 4
    :> [NextVS |-> {"n4"},
      VS |-> {"n3"},
      height |-> 4,
      lastCommit |-> { "n1", "n3", "n4" },
      time |-> 8]
  @@ 5
    :> [NextVS |-> { "n1", "n2", "n3", "n4" },
      VS |-> {"n4"},
      height |-> 5,
      lastCommit |-> {"n3"},
      time |-> 9]
/\ fetchedLightBlocks = 1
    :> [Commits |-> { "n1", "n2", "n3", "n4" },
      header |->
        [NextVS |-> {"n1"},
          VS |-> { "n1", "n2", "n3", "n4" },
          height |-> 1,
          lastCommit |-> {},
          time |-> 1]]
  @@ 4
    :> [Commits |-> {"n3"},
      header |->
        [NextVS |-> {"n4"},
          VS |-> {"n3"},
          height |-> 4,
          lastCommit |-> { "n1", "n3", "n4" },
          time |-> 8]]
/\ history = 0
    :> [current |->
        [Commits |-> { "n1", "n2", "n3", "n4" },
          header |->
            [NextVS |-> {"n1"},
              VS |-> { "n1", "n2", "n3", "n4" },
              height |-> 1,
              lastCommit |-> {},
              time |-> 1]],
      now |-> 1399,
      verdict |-> "SUCCESS",
      verified |->
        [Commits |-> { "n1", "n2", "n3", "n4" },
          header |->
            [NextVS |-> {"n1"},
              VS |-> { "n1", "n2", "n3", "n4" },
              height |-> 1,
              lastCommit |-> {},
              time |-> 1]]]
  @@ 1
    :> [current |->
        [Commits |-> {"n3"},
          header |->
            [NextVS |-> {"n4"},
              VS |-> {"n3"},
              height |-> 4,
              lastCommit |-> { "n1", "n3", "n4" },
              time |-> 8]],
      now |-> 1399,
      verdict |-> "NOT_ENOUGH_TRUST",
      verified |->
        [Commits |-> { "n1", "n2", "n3", "n4" },
          header |->
            [NextVS |-> {"n1"},
              VS |-> { "n1", "n2", "n3", "n4" },
              height |-> 1,
              lastCommit |-> {},
              time |-> 1]]]
/\ latestVerified = [Commits |-> { "n1", "n2", "n3", "n4" },
  header |->
    [NextVS |-> {"n1"},
      VS |-> { "n1", "n2", "n3", "n4" },
      height |-> 1,
      lastCommit |-> {},
      time |-> 1]]
/\ lightBlockStatus = 1 :> "StateVerified" @@ 4 :> "StateUnverified"
/\ nextHeight = 2
/\ now = 1400
/\ nprobes = 1
/\ prevCurrent = [Commits |-> {"n3"},
  header |->
    [NextVS |-> {"n4"},
      VS |-> {"n3"},
      height |-> 4,
      lastCommit |-> { "n1", "n3", "n4" },
      time |-> 8]]
/\ prevNow = 1399
/\ prevVerdict = "NOT_ENOUGH_TRUST"
/\ prevVerified = [Commits |-> { "n1", "n2", "n3", "n4" },
  header |->
    [NextVS |-> {"n1"},
      VS |-> { "n1", "n2", "n3", "n4" },
      height |-> 1,
      lastCommit |-> {},
      time |-> 1]]
/\ state = "working"

(* Transition 2 to State4 *)

State4 ==
/\ Faulty = {"n2"}
/\ blockchain = 1
    :> [NextVS |-> {"n1"},
      VS |-> { "n1", "n2", "n3", "n4" },
      height |-> 1,
      lastCommit |-> {},
      time |-> 1]
  @@ 2
    :> [NextVS |-> { "n1", "n3", "n4" },
      VS |-> {"n1"},
      height |-> 2,
      lastCommit |-> { "n2", "n3", "n4" },
      time |-> 4]
  @@ 3
    :> [NextVS |-> {"n3"},
      VS |-> { "n1", "n3", "n4" },
      height |-> 3,
      lastCommit |-> {"n1"},
      time |-> 5]
  @@ 4
    :> [NextVS |-> {"n4"},
      VS |-> {"n3"},
      height |-> 4,
      lastCommit |-> { "n1", "n3", "n4" },
      time |-> 8]
  @@ 5
    :> [NextVS |-> { "n1", "n2", "n3", "n4" },
      VS |-> {"n4"},
      height |-> 5,
      lastCommit |-> {"n3"},
      time |-> 9]
/\ fetchedLightBlocks = 1
    :> [Commits |-> { "n1", "n2", "n3", "n4" },
      header |->
        [NextVS |-> {"n1"},
          VS |-> { "n1", "n2", "n3", "n4" },
          height |-> 1,
          lastCommit |-> {},
          time |-> 1]]
  @@ 2
    :> [Commits |-> {"n1"},
      header |->
        [NextVS |-> { "n1", "n3", "n4" },
          VS |-> {"n1"},
          height |-> 2,
          lastCommit |-> { "n2", "n3", "n4" },
          time |-> 4]]
  @@ 4
    :> [Commits |-> {"n3"},
      header |->
        [NextVS |-> {"n4"},
          VS |-> {"n3"},
          height |-> 4,
          lastCommit |-> { "n1", "n3", "n4" },
          time |-> 8]]
/\ history = 0
    :> [current |->
        [Commits |-> { "n1", "n2", "n3", "n4" },
          header |->
            [NextVS |-> {"n1"},
              VS |-> { "n1", "n2", "n3", "n4" },
              height |-> 1,
              lastCommit |-> {},
              time |-> 1]],
      now |-> 1399,
      verdict |-> "SUCCESS",
      verified |->
        [Commits |-> { "n1", "n2", "n3", "n4" },
          header |->
            [NextVS |-> {"n1"},
              VS |-> { "n1", "n2", "n3", "n4" },
              height |-> 1,
              lastCommit |-> {},
              time |-> 1]]]
  @@ 1
    :> [current |->
        [Commits |-> {"n3"},
          header |->
            [NextVS |-> {"n4"},
              VS |-> {"n3"},
              height |-> 4,
              lastCommit |-> { "n1", "n3", "n4" },
              time |-> 8]],
      now |-> 1399,
      verdict |-> "NOT_ENOUGH_TRUST",
      verified |->
        [Commits |-> { "n1", "n2", "n3", "n4" },
          header |->
            [NextVS |-> {"n1"},
              VS |-> { "n1", "n2", "n3", "n4" },
              height |-> 1,
              lastCommit |-> {},
              time |-> 1]]]
  @@ 2
    :> [current |->
        [Commits |-> {"n1"},
          header |->
            [NextVS |-> { "n1", "n3", "n4" },
              VS |-> {"n1"},
              height |-> 2,
              lastCommit |-> { "n2", "n3", "n4" },
              time |-> 4]],
      now |-> 1400,
      verdict |-> "SUCCESS",
      verified |->
        [Commits |-> { "n1", "n2", "n3", "n4" },
          header |->
            [NextVS |-> {"n1"},
              VS |-> { "n1", "n2", "n3", "n4" },
              height |-> 1,
              lastCommit |-> {},
              time |-> 1]]]
/\ latestVerified = [Commits |-> {"n1"},
  header |->
    [NextVS |-> { "n1", "n3", "n4" },
      VS |-> {"n1"},
      height |-> 2,
      lastCommit |-> { "n2", "n3", "n4" },
      time |-> 4]]
/\ lightBlockStatus = 1 :> "StateVerified" @@ 2 :> "StateVerified" @@ 4 :> "StateUnverified"
/\ nextHeight = 3
/\ now = 1400
/\ nprobes = 2
/\ prevCurrent = [Commits |-> {"n1"},
  header |->
    [NextVS |-> { "n1", "n3", "n4" },
      VS |-> {"n1"},
      height |-> 2,
      lastCommit |-> { "n2", "n3", "n4" },
      time |-> 4]]
/\ prevNow = 1400
/\ prevVerdict = "SUCCESS"
/\ prevVerified = [Commits |-> { "n1", "n2", "n3", "n4" },
  header |->
    [NextVS |-> {"n1"},
      VS |-> { "n1", "n2", "n3", "n4" },
      height |-> 1,
      lastCommit |-> {},
      time |-> 1]]
/\ state = "working"

(* Transition 3 to State5 *)

State5 ==
/\ Faulty = {"n2"}
/\ blockchain = 1
    :> [NextVS |-> {"n1"},
      VS |-> { "n1", "n2", "n3", "n4" },
      height |-> 1,
      lastCommit |-> {},
      time |-> 1]
  @@ 2
    :> [NextVS |-> { "n1", "n3", "n4" },
      VS |-> {"n1"},
      height |-> 2,
      lastCommit |-> { "n2", "n3", "n4" },
      time |-> 4]
  @@ 3
    :> [NextVS |-> {"n3"},
      VS |-> { "n1", "n3", "n4" },
      height |-> 3,
      lastCommit |-> {"n1"},
      time |-> 5]
  @@ 4
    :> [NextVS |-> {"n4"},
      VS |-> {"n3"},
      height |-> 4,
      lastCommit |-> { "n1", "n3", "n4" },
      time |-> 8]
  @@ 5
    :> [NextVS |-> { "n1", "n2", "n3", "n4" },
      VS |-> {"n4"},
      height |-> 5,
      lastCommit |-> {"n3"},
      time |-> 9]
/\ fetchedLightBlocks = 1
    :> [Commits |-> { "n1", "n2", "n3", "n4" },
      header |->
        [NextVS |-> {"n1"},
          VS |-> { "n1", "n2", "n3", "n4" },
          height |-> 1,
          lastCommit |-> {},
          time |-> 1]]
  @@ 2
    :> [Commits |-> {"n1"},
      header |->
        [NextVS |-> { "n1", "n3", "n4" },
          VS |-> {"n1"},
          height |-> 2,
          lastCommit |-> { "n2", "n3", "n4" },
          time |-> 4]]
  @@ 3
    :> [Commits |-> { "n1", "n3", "n4" },
      header |->
        [NextVS |-> {"n3"},
          VS |-> { "n1", "n3", "n4" },
          height |-> 3,
          lastCommit |-> {"n1"},
          time |-> 5]]
  @@ 4
    :> [Commits |-> {"n3"},
      header |->
        [NextVS |-> {"n4"},
          VS |-> {"n3"},
          height |-> 4,
          lastCommit |-> { "n1", "n3", "n4" },
          time |-> 8]]
/\ history = 0
    :> [current |->
        [Commits |-> { "n1", "n2", "n3", "n4" },
          header |->
            [NextVS |-> {"n1"},
              VS |-> { "n1", "n2", "n3", "n4" },
              height |-> 1,
              lastCommit |-> {},
              time |-> 1]],
      now |-> 1399,
      verdict |-> "SUCCESS",
      verified |->
        [Commits |-> { "n1", "n2", "n3", "n4" },
          header |->
            [NextVS |-> {"n1"},
              VS |-> { "n1", "n2", "n3", "n4" },
              height |-> 1,
              lastCommit |-> {},
              time |-> 1]]]
  @@ 1
    :> [current |->
        [Commits |-> {"n3"},
          header |->
            [NextVS |-> {"n4"},
              VS |-> {"n3"},
              height |-> 4,
              lastCommit |-> { "n1", "n3", "n4" },
              time |-> 8]],
      now |-> 1399,
      verdict |-> "NOT_ENOUGH_TRUST",
      verified |->
        [Commits |-> { "n1", "n2", "n3", "n4" },
          header |->
            [NextVS |-> {"n1"},
              VS |-> { "n1", "n2", "n3", "n4" },
              height |-> 1,
              lastCommit |-> {},
              time |-> 1]]]
  @@ 2
    :> [current |->
        [Commits |-> {"n1"},
          header |->
            [NextVS |-> { "n1", "n3", "n4" },
              VS |-> {"n1"},
              height |-> 2,
              lastCommit |-> { "n2", "n3", "n4" },
              time |-> 4]],
      now |-> 1400,
      verdict |-> "SUCCESS",
      verified |->
        [Commits |-> { "n1", "n2", "n3", "n4" },
          header |->
            [NextVS |-> {"n1"},
              VS |-> { "n1", "n2", "n3", "n4" },
              height |-> 1,
              lastCommit |-> {},
              time |-> 1]]]
  @@ 3
    :> [current |->
        [Commits |-> { "n1", "n3", "n4" },
          header |->
            [NextVS |-> {"n3"},
              VS |-> { "n1", "n3", "n4" },
              height |-> 3,
              lastCommit |-> {"n1"},
              time |-> 5]],
      now |-> 1400,
      verdict |-> "SUCCESS",
      verified |->
        [Commits |-> {"n1"},
          header |->
            [NextVS |-> { "n1", "n3", "n4" },
              VS |-> {"n1"},
              height |-> 2,
              lastCommit |-> { "n2", "n3", "n4" },
              time |-> 4]]]
/\ latestVerified = [Commits |-> { "n1", "n3", "n4" },
  header |->
    [NextVS |-> {"n3"},
      VS |-> { "n1", "n3", "n4" },
      height |-> 3,
      lastCommit |-> {"n1"},
      time |-> 5]]
/\ lightBlockStatus = 1 :> "StateVerified"
  @@ 2 :> "StateVerified"
  @@ 3 :> "StateVerified"
  @@ 4 :> "StateUnverified"
/\ nextHeight = 4
/\ now = 1400
/\ nprobes = 3
/\ prevCurrent = [Commits |-> { "n1", "n3", "n4" },
  header |->
    [NextVS |-> {"n3"},
      VS |-> { "n1", "n3", "n4" },
      height |-> 3,
      lastCommit |-> {"n1"},
      time |-> 5]]
/\ prevNow = 1400
/\ prevVerdict = "SUCCESS"
/\ prevVerified = [Commits |-> {"n1"},
  header |->
    [NextVS |-> { "n1", "n3", "n4" },
      VS |-> {"n1"},
      height |-> 2,
      lastCommit |-> { "n2", "n3", "n4" },
      time |-> 4]]
/\ state = "working"

(* The following formula holds true in the last state and violates the invariant *)

InvariantViolation ==
  Cardinality((DOMAIN fetchedLightBlocks)) = 4
    /\ BMC!Skolem((\E s$2 \in DOMAIN history:
      3 * Cardinality(history[s$2]["current"]["Commits"])
        >= 2 * Cardinality(history[s$2]["current"]["header"]["VS"])))

================================================================================
\* Created by Apalache on Fri Nov 06 10:21:03 UTC 2020
\* https://github.com/informalsystems/apalache
