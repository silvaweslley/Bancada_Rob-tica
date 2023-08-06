(define (problem problem_processing)
(:domain processing)
(:requirements :strips :typing)

    (:objects 
        modulo_sep - separation
        modulo_med - measurement
        this_Station - input
        next_Station - output
        Ae1 - atua_Elev
        Ar1 - atua_Ramp
        pack1 - part
    )
    
    (:init
        (at Ae1 this_Station)
        (at Ar1 modulo_med)
        (in pack1 modulo_sep)
        
        ;; Ground Connections
        (connected modulo_sep this_Station)
        (connected this_Station modulo_med)
        (connected modulo_med next_Station)
    )
    
    (:goal (and 
        (in pack1 next_Station)
        (at Ae1 this_Station)
        (at Ar1 modulo_med)
    ))
)