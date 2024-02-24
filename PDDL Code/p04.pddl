(define (problem p4-dungeon)
  (:domain Dungeon)

  ; Come up with your own problem instance (see assignment for details)
  ; NOTE: You _may_ use new objects for this problem only.

  ; Naming convention:
  ; - loc-{i}-{j} refers to the location at the i'th column and j'th row (starting in top left corner)
  ; - c{i}{j}{h}{k} refers to the corridor connecting loc-{i}-{j} and loc-{h}-{k}
  (:objects
    loc-1-1 loc-2-1 loc-2-2 loc-3-2 loc-4-2 loc-1-3 loc-2-3 loc-3-3 loc-1-4 - location
    key1 key2 key3 key4 key5 - key
    c1121 c2122 c2132 c3242 c2223 c1323 c2333 c3233 c1314 - corridor
  )

  (:init

    ; Hero location and carrying status
    (hero_at loc-2-3)
    (not (hero_has_key key1))
    (not (hero_has_key key2))
    (not (hero_has_key key3))
    (not (hero_has_key key4))
    (not (hero_has_key key5))
    
    ; Locationg <> Corridor Connections
    (corridor_connection c1121 loc-1-1 loc-2-1) 
    (corridor_connection c1121 loc-2-1 loc-1-1) 
    (corridor_connected_to c1121 loc-1-1) 
    (corridor_connected_to c1121 loc-2-1)
    
    (corridor_connection c2122 loc-2-1 loc-2-2) 
    (corridor_connection c2122 loc-2-2 loc-2-1) 
    (corridor_connected_to c2122 loc-2-1) 
    (corridor_connected_to c2122 loc-2-2)
    
    (corridor_connection c2132 loc-2-1 loc-3-2) 
    (corridor_connection c2132 loc-3-2 loc-2-1) 
    (corridor_connected_to c2132 loc-2-1) 
    (corridor_connected_to c2132 loc-3-2)
    
    (corridor_connection c3242 loc-3-2 loc-4-2) 
    (corridor_connection c3242 loc-4-2 loc-3-2) 
    (corridor_connected_to c3242 loc-3-2) 
    (corridor_connected_to c3242 loc-4-2)
    
    (corridor_connection c2223 loc-2-2 loc-2-3) 
    (corridor_connection c2223 loc-2-3 loc-2-2)
    (corridor_connected_to c2223 loc-2-2) 
    (corridor_connected_to c2223 loc-2-3)
    
    (corridor_connection c1323 loc-1-3 loc-2-3) 
    (corridor_connection c1323 loc-2-3 loc-1-3) 
    (corridor_connected_to c1323 loc-1-3) 
    (corridor_connected_to c1323 loc-2-3)
    
    (corridor_connection c2333 loc-2-3 loc-3-3) 
    (corridor_connection c2333 loc-3-3 loc-2-3) 
    (corridor_connected_to c2333 loc-2-3) 
    (corridor_connected_to c2333 loc-3-3)
    
    (corridor_connection c3233 loc-3-2 loc-3-3) 
    (corridor_connection c3233 loc-3-3 loc-3-2) 
    (corridor_connected_to c3233 loc-3-2) 
    (corridor_connected_to c3233 loc-3-3)
    
    (corridor_connection c1314 loc-1-3 loc-1-4) 
    (corridor_connection c1314 loc-1-4 loc-1-3) 
    (corridor_connected_to c1314 loc-1-3) 
    (corridor_connected_to c1314 loc-1-4)
    
    ; Key locations
    (key_at key1 loc-2-3)
    (key_at key2 loc-2-1)
    (key_at key3 loc-2-1)
    (key_at key4 loc-4-2)
    (key_at key5 loc-1-4)
    
    ; Locked corridors
    (corridor_locked c1314 purple)
    (corridor_locked_state c1314)
    
    (corridor_locked c2122 red)
    (corridor_locked_state c2122)
    
    (corridor_locked c2223 red)
    (corridor_locked_state c2223)
    
    (corridor_locked c3242 yellow)
    (corridor_locked_state c3242)
 
    (corridor_locked c3233 yellow)
    (corridor_locked_state c3233)
    
    (corridor_locked c1323 green)
    (corridor_locked_state c1323)
    
    (corridor_locked c1121 rainbow)
    (corridor_locked_state c1121)
    
    ; Risky corridors
    (corridor_risky c2122)
    (corridor_risky c2223)
    
    ; Key colours
    (key_colour key1 red)
    (key_colour key2 yellow)
    (key_colour key3 purple)
    (key_colour key4 green)
    (key_colour key5 rainbow)

    ; Key usage properties (one use, two use, etc)
    (multi_use_key key1)
    (two_use_key key2)
    (one_use_key key3)
    (one_use_key key4)
    (one_use_key key5)

  )
  (:goal
    (and
      ; Hero's final location goes here
      (hero_at loc-1-1)
    )
  )

)
