(define (problem p2-dungeon)
  (:domain Dungeon)

  ; Naming convention:
  ; - loc-{i}-{j} refers to the location at the i'th column and j'th row (starting in top left corner)
  ; - c{i}{j}{h}{k} refers to the corridor connecting loc-{i}-{j} and loc-{h}-{k}
  (:objects
    loc-2-1 loc-1-2 loc-2-2 loc-3-2 loc-4-2 loc-2-3 - location
    key1 key2 key3 key4 - key
    c2122 c1222 c2232 c3242 c2223 - corridor
  )

  (:init

    ; Hero location and carrying status
    (hero_at loc-2-2)
    (not (hero_has_key key1))
    (not (hero_has_key key2))
    (not (hero_has_key key3))
    (not (hero_has_key key4))
    
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
    
    (corridor_connection c3242 loc-3-2 loc-4-2)
    (corridor_connection c3242 loc-4-2 loc-3-2)
    (corridor_connected_to c3242 loc-3-2)
    (corridor_connected_to c3242 loc-4-2)
    
    (corridor_connection c2223 loc-2-2 loc-2-3)
    (corridor_connection c2223 loc-2-3 loc-2-2)
    (corridor_connected_to c2223 loc-2-2)
    (corridor_connected_to c2223 loc-2-3)
    
    ; Key locations
    (key_at key1 loc-2-1)
    (key_at key2 loc-1-2)
    (key_at key3 loc-2-2)
    (key_at key4 loc-2-3)
    
    
    ; Locked corridors
    (corridor_locked c1222 yellow)
    (corridor_locked_state c1222)
    
    (corridor_locked c2122 purple)
    (corridor_locked_state c2122)
    
    (corridor_locked c2223 green)
    (corridor_locked_state c2223)
    
    (corridor_locked c2232 yellow)
    (corridor_locked_state c2232)
    
    (corridor_locked c3242 rainbow)
    (corridor_locked_state c3242)
    
    ; Risky corridors

        ; None (there are no corridors with red locks)
    
    ; Key colours
    (key_colour key1 green)
    (key_colour key2 rainbow)
    (key_colour key3 purple)
    (key_colour key4 yellow)
    
    ; Key usage properties (one use, two use, etc)
    (one_use_key key1)
    (one_use_key key2)
    (one_use_key key3)
    (two_use_key key4)

  )
  (:goal
    (and
      ; Hero's final location goes here
      (hero_at loc-4-2)
    )
  )

)

