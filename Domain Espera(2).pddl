(define (domain waiting)
    (:requirements :strips :typing :negative-preconditions)
    
    (:types 
            location atua_mat part treadmill - object
            waiting_point input output - location
    )
    
    (:predicates
        (connected ?from ?to - location)
        
        (in ?p - part ?l - location)
        (advance ?a - atua_mat)
        (busy ?l - location)
        (on ?t - treadmill)
    )
    
    (:action move
        :parameters (?p - part ?from ?to - location)
        :precondition (and
            (in ?p ?from)
            (not (busy ?to))
        )
        :effect (and
            (not (in ?p ?from))
            (in ?p ?to)
            (busy ?to)
        )
    )
    
    (:action treadmill_on
        :parameters (?p - part ?i - input ?t - treadmill)
        :precondition (and
            (in ?p ?i)
            (not (on ?t))
        )
        :effect (and
            (on ?t)
        )
    )
    
    (:action push_atuador
        :parameters (?a - atua_mat ?p - part ?w - waiting_point ?o - output ?i - input)
        :precondition (and
            (busy ?o)
            (in ?p ?i)
            (not (advance ?a))
        )
        :effect (and
            (advance ?a)
            (in ?p ?w)
        )
    )
    
    (:action release
        :parameters (?a - atua_mat ?p - part ?w - waiting_point ?o - output)
        :precondition (and
            (advance ?a)
            (in ?p ?w)
            (not (busy ?o))
        )
        :effect (and
            (in ?p ?o)
            (not (advance ?a))
        )
    )
)