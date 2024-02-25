(define (problem p3-dungeon)
  (:domain Dungeon)

  ; Naming convention:
  ; - loc-{i}-{j} refers to the location at the i'th column and j'th row (starting in top left corner)
  ; - c{i}{j}{h}{k} refers to the corridor connecting loc-{i}-{j} and loc-{h}-{k}
  (:objects
    loc-3-4 loc-4-5 loc-1-2 loc-2-2 loc-3-2 loc-3-3 loc-2-5 loc-1-3 loc-2-1 loc-1-4 loc-3-5 loc-2-4 loc-4-4 loc-2-3 loc-4-3 - location
    c2122 c1222 c2232 c1213 c1223 c2223 c3223 c3233 c1323 c2333 c1314 c2314 c2324 c2334 c3334 c1424 c2434 c2425 c2535 c3545 c4544 c4443 - corridor
    key1 key2 key3 key4 key5 key6 - key
  )

  (:init

    ; Hero location and carrying status
    (hero_at loc-2-1)
    (not (hero_has_key key1))
    (not (hero_has_key key2))
    (not (hero_has_key key3))
    (not (hero_has_key key4))
    (not (hero_has_key key5))
    (not (hero_has_key key6))
    
    ; Locationg <> Corridor Connections
    (corridor_connection c2122 loc-2-1 loc-2-2)
    (corridor_connection c2122 loc-2-2 loc-2-1)
    (corridor_connected_to c2122 loc-2-1)
    (corridor_connected_to c2122 loc-2-2)
    
    (corridor_connection c1222 loc-1-2 loc-2-2)
    (corridor_connection c1222 loc-2-2 loc-1-2)
    (corridor_connected_to c1222 loc-1-2)
    (corridor_connected_to c1222 loc-2-2)
    
    (corridor_connection c2232 loc-2-2 loc-3-2)
    (corridor_connection c2232 loc-3-2 loc-2-2)
    (corridor_connected_to c2232 loc-2-2)
    (corridor_connected_to c2232 loc-3-2)
    
    (corridor_connection c1213 loc-1-2 loc-1-3)
    (corridor_connection c1213 loc-1-3 loc-1-2)
    (corridor_connected_to c1213 loc-1-2)
    (corridor_connected_to c1213 loc-1-3)
    
    (corridor_connection c1223 loc-1-2 loc-2-3)
    (corridor_connection c1223 loc-2-3 loc-1-2)
    (corridor_connected_to c1223 loc-1-2)
    (corridor_connected_to c1223 loc-2-3)
    
    (corridor_connection c2223 loc-2-2 loc-2-3)
    (corridor_connection c2223 loc-2-3 loc-2-2)
    (corridor_connected_to c2223 loc-2-2)
    (corridor_connected_to c2223 loc-2-3)
    
    (corridor_connection c3223 loc-3-2 loc-2-3)
    (corridor_connection c3223 loc-2-3 loc-3-2)
    (corridor_connected_to c3223 loc-3-2)
    (corridor_connected_to c3223 loc-2-3)
    
    (corridor_connection c3233 loc-3-2 loc-3-3)
    (corridor_connection c3233 loc-3-3 loc-3-2)
    (corridor_connected_to c3233 loc-3-2)
    (corridor_connected_to c3233 loc-3-3)
    
    (corridor_connection c1323 loc-1-3 loc-2-3)
    (corridor_connection c1323 loc-2-3 loc-1-3)
    (corridor_connected_to c1323 loc-1-3)
    (corridor_connected_to c1323 loc-2-3)
    
    (corridor_connection c2333 loc-2-3 loc-3-3)
    (corridor_connection c2333 loc-3-3 loc-2-3)
    (corridor_connected_to c2333 loc-2-3)
    (corridor_connected_to c2333 loc-3-3)
    
    (corridor_connection c1314 loc-1-3 loc-1-4)
    (corridor_connection c1314 loc-1-4 loc-1-3)
    (corridor_connected_to c1314 loc-1-3)
    (corridor_connected_to c1314 loc-1-4)
    
    (corridor_connection c2314 loc-2-3 loc-1-4)
    (corridor_connection c2314 loc-1-4 loc-2-3)
    (corridor_connected_to c2314 loc-2-3)
    (corridor_connected_to c2314 loc-1-4)
    
    (corridor_connection c2324 loc-2-3 loc-2-4)
    (corridor_connection c2324 loc-2-4 loc-2-3)
    (corridor_connected_to c2324 loc-2-3)
    (corridor_connected_to c2324 loc-2-4)
    
    (corridor_connection c2334 loc-2-3 loc-3-4)
    (corridor_connection c2334 loc-3-4 loc-2-3)
    (corridor_connected_to c2334 loc-2-3)
    (corridor_connected_to c2334 loc-3-4)
    
    (corridor_connection c3334 loc-3-3 loc-3-4)
    (corridor_connection c3334 loc-3-4 loc-3-3)
    (corridor_connected_to c3334 loc-3-3)
    (corridor_connected_to c3334 loc-3-4)
    
    (corridor_connection c1424 loc-1-4 loc-2-4)
    (corridor_connection c1424 loc-2-4 loc-1-4)
    (corridor_connected_to c1424 loc-1-4)
    (corridor_connected_to c1424 loc-2-4)
    
    (corridor_connection c2434 loc-2-4 loc-3-4)
    (corridor_connection c2434 loc-3-4 loc-2-4)
    (corridor_connected_to c2434 loc-2-4)
    (corridor_connected_to c2434 loc-3-4)
    
    (corridor_connection c2425 loc-2-4 loc-2-5)
    (corridor_connection c2425 loc-2-5 loc-2-4)
    (corridor_connected_to c2425 loc-2-4)
    (corridor_connected_to c2425 loc-2-5)
    
    (corridor_connection c2535 loc-2-5 loc-3-5)
    (corridor_connection c2535 loc-3-5 loc-2-5)
    (corridor_connected_to c2535 loc-2-5)
    (corridor_connected_to c2535 loc-3-5)
    
    (corridor_connection c3545 loc-3-5 loc-4-5)
    (corridor_connection c3545 loc-4-5 loc-3-5)
    (corridor_connected_to c3545 loc-3-5)
    (corridor_connected_to c3545 loc-4-5)
    
    (corridor_connection c4544 loc-4-5 loc-4-4)
    (corridor_connection c4544 loc-4-4 loc-4-5)
    (corridor_connected_to c4544 loc-4-5)
    (corridor_connected_to c4544 loc-4-4)
    
    (corridor_connection c4443 loc-4-4 loc-4-3)
    (corridor_connection c4443 loc-4-3 loc-4-4)
    (corridor_connected_to c4443 loc-4-4)
    (corridor_connected_to c4443 loc-4-3)

    ; Key locations
    (key_at key1 loc-2-1)
    (key_at key2 loc-2-3)
    (key_at key3 loc-2-3)
    (key_at key4 loc-2-3)
    (key_at key5 loc-2-3)
    (key_at key6 loc-4-4)
    
    ; Locked corridors
    (corridor_locked c1223 red)
    (corridor_locked_state c1223)
    
    (corridor_locked c2223 red)
    (corridor_locked_state c2223)
    
    (corridor_locked c3223 red)
    (corridor_locked_state c3223)
    
    (corridor_locked c1323 red)
    (corridor_locked_state c1323)
    
    (corridor_locked c2333 red)
    (corridor_locked_state c2333)
    
    (corridor_locked c2314 red)
    (corridor_locked_state c2314)
    
    (corridor_locked c2324 red)
    (corridor_locked_state c2324)
    
    (corridor_locked c2334 red)
    (corridor_locked_state c2334)
    
    (corridor_locked c2425 purple)
    (corridor_locked_state c2425)
    
    (corridor_locked c2535 green)
    (corridor_locked_state c2535)
    
    (corridor_locked c3545 purple)
    (corridor_locked_state c3545)
    
    (corridor_locked c4544 green)
    (corridor_locked_state c4544)
    
    (corridor_locked c4443 rainbow)
    (corridor_locked_state c4443)
    
    
    ; Risky corridors
    (corridor_risky c1223)
    (corridor_risky c2223)
    (corridor_risky c3223)
    (corridor_risky c1323)
    (corridor_risky c2333)
    (corridor_risky c2314)
    (corridor_risky c2324)
    (corridor_risky c2334)
    
    ; Key colours
    (key_colour key1 red)
    (key_colour key2 green)
    (key_colour key3 green)
    (key_colour key4 purple)
    (key_colour key5 purple)
    (key_colour key6 rainbow)
    
    ; Key usage properties (one use, two use, etc)
    (multi_use_key key1)
    (one_use_key key2)
    (one_use_key key3)
    (one_use_key key4)
    (one_use_key key5)
    (one_use_key key6)
    
  )
  (:goal
    (and
      ; Hero's final location goes here
      (hero_at loc-4-3)
    )
  )

)
