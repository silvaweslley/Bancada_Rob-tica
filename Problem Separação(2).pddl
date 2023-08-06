(define (problem problem_separation)
(:domain separation)
(:requirements :strips :typing)

    (:objects 
        this_station - input 
        red_part - PartRed
        black_part - PartBlack
        metal_part - PartMetal
        sensor_cap - Sens_Cap
        sensor_ind - Sens_Ind
        sensor_rampa - Sens_Ramp
        Atuador_Red - Atua_Red
        Atuador_Metal - Atua_Metal
        ramp_red - Ramp_Red
        ramp_black - Ramp_Black
        ramp_metal - Ramp_Metal
    )
    
    (:init
        (in red_part this_station)
        (in black_part this_station)
        (in metal_part this_station)
        (not (forward Atuador_Red))
        (not (forward Atuador_Metal))
        
         ;; Ground Connections
        (connected this_station sensor_ind)
        (connected sensor_ind sensor_cap)
        (connected sensor_cap sensor_rampa)
        (connected sensor_rampa ramp_black)
    )
    
    (:goal (and 
        (in red_part ramp_red)
        (in black_part ramp_black)
        (in metal_part ramp_metal)
        (not (forward Atuador_Red))
        (not (forward Atuador_Metal))
    ))
)