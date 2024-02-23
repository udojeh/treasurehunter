(define (problem p1-dungeon)
  (:domain Dungeon)

  ; Naming convention:
  ; - loc-{i}-{j} refers to the location at the i'th column and j'th row (starting in top left corner)
  ; - c{i}{j}{h}{k} refers to the corridor connecting loc-{i}-{j} and loc-{h}-{k}
  (:objects
    loc-3-1 loc-1-2 loc-2-2 loc-3-2 loc-4-2 loc-2-3 loc-3-3 loc-2-4 loc-3-4 loc-4-4 - location
    key1 key2 key3 key4 - key
    c3132 c1222 c2232 c3242 c2223 c3233 c2333 c2324 c3334 c2434 c3444 - corridor
  )

  (:init

    ; Hero location and carrying status
    (hero_at loc-1-2)
    (not (hero_has_key key1))
    (not (hero_has_key key2))
    (not (hero_has_key key3))
    (not (hero_has_key key4))

    ; Locationg <> Corridor Connections
    (corridor_connection c3132 loc-3-1 loc-3-2)
    (corridor_connection c3132 loc-3-2 loc-3-1)
    (corridor_connected_to c3132 loc-3-1)
    (corridor_connected_to c3132 loc-3-2)
    
    (corridor_connection c1222 loc-1-2 loc-2-2)
    (corridor_connection c1222 loc-2-2 loc-1-2)
    (corridor_connected_to c1222 loc-1-2)
    (corridor_connected_to c1222 loc-2-2)
    
    (corridor_connection c2232 loc-2-2 loc-3-2)
    (corridor_connection c2232 loc-3-2 loc-2-2)
    (corridor_connected_to c2232 loc-2-2)
    (corridor_connected_to c2232 loc-3-2)
    
    (corridor_connection c3242 loc-3-2 loc-4-2)
    (corridor_connection c3242 loc-4-2 loc-3-2)
    (corridor_connected_to c3242 loc-3-2)
    (corridor_connected_to c3242 loc-4-2)
    
    (corridor_connection c2223 loc-2-2 loc-2-3)
    (corridor_connection c2223 loc-2-3 loc-2-2)
    (corridor_connected_to c2223 loc-2-2)
    (corridor_connected_to c2223 loc-2-3)
    
    (corridor_connection c3233 loc-3-2 loc-3-3)
    (corridor_connection c3233 loc-3-3 loc-3-2)
    (corridor_connected_to c3233 loc-3-2)
    (corridor_connected_to c3233 loc-3-3)
    
    (corridor_connection c2333 loc-2-3 loc-3-3)
    (corridor_connection c2333 loc-3-3 loc-2-3)
    (corridor_connected_to c2333 loc-2-3)
    (corridor_connected_to c2333 loc-3-3)
    
    (corridor_connection c2324 loc-2-3 loc-2-4)
    (corridor_connection c2324 loc-2-4 loc-2-3)
    (corridor_connected_to c2324 loc-2-3)
    (corridor_connected_to c2324 loc-2-4)
    
    (corridor_connection c3334 loc-3-3 loc-3-4)
    (corridor_connection c3334 loc-3-4 loc-3-3)
    (corridor_connected_to c3334 loc-3-3)
    (corridor_connected_to c3334 loc-3-4)
    
    (corridor_connection c2434 loc-2-4 loc-3-4)
    (corridor_connection c2434 loc-3-4 loc-2-4)
    (corridor_connected_to c2434 loc-2-4)
    (corridor_connected_to c2434 loc-3-4)
    
    (corridor_connection c3444 loc-3-4 loc-4-4)
    (corridor_connection c3444 loc-4-4 loc-3-4)
    (corridor_connected_to c3444 loc-3-4)
    (corridor_connected_to c3444 loc-4-4)
    
    ; Key locations
    (key_at key1 loc-2-2)
    (key_at key2 loc-2-4)
    (key_at key3 loc-4-2)
    (key_at key4 loc-4-4)
    
    ; Locked corridors
    (corridor_locked c3242 purple)
    (corridor_locked_state c3242)
    
    (corridor_locked c2324 red)
    (corridor_locked_state c2324)
    
    (corridor_locked c2434 red)
    (corridor_locked_state c2434)
    
    (corridor_locked c3444 yellow)
    (corridor_locked_state c3444)
    
    (corridor_locked c3132 rainbow)
    (corridor_locked_state c3132)

    ; Risky corridors
    (corridor_risky c2324)
    (corridor_risky c2434)

    ; Key colours
    (key_colour key1 red)
    (key_colour key2 yellow)
    (key_colour key3 rainbow)
    (key_colour key4 purple)
    
    ; Key usage properties (one use, two use, etc)
    (multi_use_key key1)
    (two_use_key key2)
    (one_use_key key3)
    (one_use_key key4)
    
  )
  (:goal
    (and
      ; Hero's final location goes here
      (hero_at loc-3-1)
    )
  )

)
