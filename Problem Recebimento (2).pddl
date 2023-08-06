(define (problem problem_changeover)
(:domain changeover)
(:requirements :strips :typing)

    (:objects 
        magazine - storage
        this_Station - input
        waiting_point - waiting
        next_Station - output
        Ag1 - atua_gir
        pack1 - part
    )
    
    (:init
        (at Ag1 waiting_point)
        (in pack1 magazine)
        
        ;; Ground Connections
        (connected magazine this_Station)
        (connected this_Station waiting_point)
        (connected waiting_point next_Station)
    )
    
    (:goal (and 
        (in pack1 next_Station)
        (at Ag1 waiting_point)
    ))
)