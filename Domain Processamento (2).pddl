(define (domain processing)
    (:requirements :strips :typing)
    
    (:types 
            location atuadores part - object
            separation input measurement output - location
            atua_Ramp atua_Elev - atuadores
    )
    
    (:predicates
        (connected ?from ?to - location)
        
        (in ?p - part ?l - location)
        (at ?a - atuadores ?l - location)
    )
    
    (:action verification
        :parameters (?p - part ?s - separation ?i - input)
        :precondition (and
            (in ?p ?s)
        )
        :effect (and
            (not (in ?p ?s))
            (in ?p ?i)
        )
    )
    
    (:action move
        :parameters (?a - atuadores ?from ?to - location)
        :precondition (and
            (at ?a ?from) 
        )
        :effect (and
            (not (at ?a ?from))
            (at ?a ?to)
        )
    )
    
    (:action raise
        :parameters (?e - atua_Elev ?p - part ?i - input ?m - measurement)
        :precondition (and
            (at ?e ?i)
            (in ?p ?i)
        )
        :effect (and
            (not (in ?p ?i))
            (not (at ?e ?i))
            (in ?p ?m)
            (at ?e ?m)
        )
    )
    
    (:action push
        :parameters (?r - atua_Ramp ?p - part ?o - output ?m - measurement)
        :precondition (and
            (at ?r ?m)
            (in ?p ?m)
        )
        :effect (and
            (not (at ?r ?m))
            (not (in ?p ?m))
            (in ?p ?o)
            (at ?r ?o)
        )
    )
    
    (:action return
        :parameters (?e - atua_Elev ?r - atua_Ramp ?o - output ?m - measurement ?i - input ?p - part)
        :precondition (and
            (at ?r ?o)
            (at ?e ?m)
            (in ?p ?o)
        )
        :effect (and
            (not (at ?r ?o))
            (not (at ?e ?m))
            (not (in ?p ?o))
            (at ?r ?m)
            (at ?e ?i)
        )
    )
)