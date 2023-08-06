(define (domain changeover)
    (:requirements :strips :typing)
    
    (:types 
            location atua_gir part - object
            storage input waiting output - location
    )
    
    (:predicates
        (connected ?from ?to - location)
    
        (in ?p - part ?l - location)
        (at ?a - atua_gir ?l - location)
        (landing ?a - atua_gir ?p - part)
    )
    
        (:action move
        :parameters (?a - atua_gir ?from - location ?to - location)
        :precondition (and
            (at ?a ?from) 
        )
        :effect (and
            (not (at ?a ?from))
            (at ?a ?to)
        )
    )
    
    (:action push
        :parameters (?p - part ?e - storage ?i - input)
        :precondition (and
            (in ?p ?e)
        )
        :effect (and
            (not (in ?p ?e))
            (in ?p ?i)
        )
    )
    
    (:action catch
        :parameters (?a - atua_gir ?w - waiting ?i - input)
        :precondition (and
            (at ?a ?w)
        )
        :effect (and
            (not (at ?a ?w))
            (at ?a ?i)
        )
    )
    
    (:action landing
        :parameters (?a - atua_gir ?p - part ?i - input)
        :precondition (and
            (at ?a ?i)
            (in ?p ?i)
        )
        :effect (and
            (not (at ?a ?i))
            (not (in ?p ?i))
            (landing ?a ?p)
        )
    )
            
    (:action release
        :parameters (?a - atua_gir ?p - part ?w - waiting ?o - output)
        :precondition (and
            (landing ?a ?p)
        )
        :effect (and
            (not (landing ?a ?p))
            (in ?p ?o)
            (at ?a ?o)
        )
    )
)