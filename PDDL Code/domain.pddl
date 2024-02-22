(define (domain Dungeon)

    (:requirements
        :typing
        :negative-preconditions
        :conditional-effects
    )

    ; Do not modify the types
    (:types
        location colour key corridor
    )

    ; Do not modify the constants
    (:constants
        red yellow green purple rainbow - colour
    )

    ; You may introduce whatever predicates you would like to use
    (:predicates

        ; One predicate given for free!
        (hero_at ?loc - location)
        (hero_has_key ?k - key)
        (hero_move_to ?to)
        (key_at ?k - key ?loc - location)
        (key_uses_left ?k - key)
        (key_colour ?k - key ?col - colour)
        (multi_use_key ?k - key)
        (two_use_key ?k - key)
        (one_use_key ?k - key)
        (useless_key ?k - key)
        (messy_room ?loc - location)
        (corridor_connected_to ?cor - corridor ?loc - location)
        (corridor_connection ?cor - corridor ?from ?to - location)
        (corridor_locked ?cor - corridor ?col - colour)
        (corridor_collapsed ?cor - corridor)
        (corridor_risky ?cor)
        
    )

    ; IMPORTANT: You should not change/add/remove the action names or parameters

    ;Hero can move if the
    ;    - hero is at current location ?from,
    ;    - hero will move to location ?to,
    ;    - corridor ?cor exists between the ?from and ?to locations
    ;    - there isn't a locked door in corridor ?cor
    ;Effects move the hero, and collapse the corridor if it's "risky" (also causing a mess in the ?to location)
    (:action move

        :parameters (?from ?to - location ?cor - corridor)

        :precondition (and (hero_at ?from)
                           (hero_move_to ?to)
                           (corridor_connection ?cor ?from ?to)
                           (not (corridor_locked ?cor))

        )

        :effect (and (not (hero_at ?from))
                     (hero_at ?to)
                (when (corridor_risky ?cor)
                    (and (corridor_collapsed ?cor)
                         (messy_room ?to)
                    )
                
                )

        )
    )

    ;Hero can pick up a key if the
    ;    - hero is at current location ?loc,
    ;    - there is a key ?k at location ?loc,
    ;    - the hero's arm is free,
    ;    - the location is not messy
    ;Effect will have the hero holding the key and their arm no longer being free
    (:action pick-up

        :parameters (?loc - location ?k - key)

        :precondition (and (hero-at ?loc)
                           (key-at ?k ?loc)
                           (not (hero_has_key ?k))
                           (not (messy_room ?loc))
        )

        :effect (and (hero_has_key ?key)
                     (not (key_at ?loc))

        )
    )

    ;Hero can drop a key if the
    ;    - hero is holding a key ?k,
    ;    - the hero is at location ?loc
    ;Effect will be that the hero is no longer holding the key
    (:action drop

        :parameters (?loc - location ?k - key)

        :precondition (and (hero_has_key ?k)
                           (hero_at ?loc)

        )

        :effect (and (not (hero_has_key ?k))
                     (key_at ?loc)

        )
    )


    ;Hero can use a key for a corridor if
    ;    - the hero is holding a key ?k,
    ;    - the key still has some uses left,
    ;    - the corridor ?cor is locked with colour ?col,
    ;    - the key ?k is if the right colour ?col,
    ;    - the hero is at location ?loc
    ;    - the corridor is connected to the location ?loc
    ;Effect will be that the corridor is unlocked and the key usage will be updated if necessary
    (:action unlock

        :parameters (?loc - location ?cor - corridor ?col - colour ?k - key)

        :precondition (and (hero_has_key ?k)
                           (not (useless_key ?k))
                           (corridor_locked ?cor ?col)
                           (key_colour ?k ?col)
                           (hero_at ?loc)
                           (corridor_connected_to ?cor ?loc)

        )

        :effect (and (not (corridor_locked ?cor ?col))
                     (when (two_use_key ?k)
                        (and (not (two_use_key ?k))
                             (one_use_key ?k)
                        )
                     )
                     (when (one_use_key ?k)
                        (and (not (one_use_key ?k))
                             (useless_key ?k)
                        )
                     )

        )
    )

    ;Hero can clean a location if
    ;    - the hero is at location ?loc,
    ;    - the location is messy
    ;Effect will be that the location is no longer messy
    (:action clean

        :parameters (?loc - location)

        :precondition (and (hero_at ?loc)
                      (messy_room ?loc)
        )

        :effect ((not (messy_room ?loc))

        )
    )

)
