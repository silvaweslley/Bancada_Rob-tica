(define (problem problem_waiting)
(:domain waiting)
(:requirements :strips :typing :negative-preconditions)

    (:objects 
        wait - waiting_point
        treadmill - treadmill
        this_Station - input
        next_Station - output
        Am1 - atua_mat
        pack1 - part
    )
    
    (:init
        (not (on treadmill))
        (in pack1 this_Station)
        (not (advance Am1))
        
         ;; Ground Connections
        (connected this_Station wait)
        (connected wait next_Station)
    )
    
    (:goal (and 
        (on treadmill)
        (in pack1 next_Station)
        (not (advance Am1))
    ))
)