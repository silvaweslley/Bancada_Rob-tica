(define (domain separation)
    (:requirements :strips :typing)
    
    (:types 
            location actuators part - object
            Input ramps sensors - location
            PartMetal PartRed PartBlack - part
            Atua_Metal Atua_Red - actuators
            Sens_Ind Sens_Cap Sens_Ramp - sensors
            Ramp_Metal Ramp_Red Ramp_Black - ramps
    )
    
    (:predicates
        (connected ?from ?to - location)
        
        (in ?p - part ?l - location)
        (reading ?s - sensors ?p - part)
        (forward ?a - actuators)
    )
    
    (:action move-part
        :parameters (?p - part ?from - Input ?to - Sens_Ind)
        :precondition (and
            (connected ?from ?to)
            (in ?p ?from)
        )
        :effect (and
            (not (in ?p ?from))
            (in ?p ?to)
        )
    )
    
    (:action keep-moving
        :parameters (?p - part ?i - Input ?from ?to - location)
        :precondition (and
            (connected ?from ?to)
            (in ?p ?from)
            (not (in ?p ?i))
        )
        :effect (and
            (not (in ?p ?from))
            (in ?p ?to)
        )
    )
    
    (:action push_part_metal
        :parameters (?pm - PartMetal ?si - Sens_Ind ?am - Atua_Metal ?sp - Sens_Ramp)
        :precondition (and
            (in ?pm ?si)
            (not (forward ?am))
        )
        :effect (and
            (in ?pm ?sp)
            (forward ?am)
        )
    )
    
    (:action push_part_red
        :parameters (?pr - PartRed ?sc - Sens_Cap ?ar - Atua_Red ?sp - Sens_Ramp)
        :precondition (and
            (in ?pr ?sc)
            (not (forward ?ar))
        )
        :effect (and
            (forward ?ar)
            (in ?pr ?sp)
        )
    )
    
    (:action return_actuator_red
        :parameters (?ar - Atua_Red ?pr - PartRed ?sp - Sens_Ramp ?rr - Ramp_Red)
        :precondition (and
            (forward ?ar)
            (in ?pr ?sp)
        )
        :effect (and
            (not (forward ?ar))
            (not (in ?pr ?sp))
            (in ?pr ?rr)
        )
    )
    
    (:action return_actuator_metal
        :parameters (?am - Atua_Metal ?pm - PartMetal ?sp - Sens_Ramp ?rm - Ramp_Metal)
        :precondition (and
            (forward ?am)
            (in ?pm ?sp)
        )
        :effect (and
            (not (forward ?am))
            (not (in ?pm ?sp))
            (in ?pm ?rm)
        )
    )
)