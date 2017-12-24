const DEFAULT_JOB_NAME = ""

const DEFAULT_DT_NULL = DateTime(0)
const DEFAULT_DT_NEXT_FIRE = DEFAULT_DT_NULL

"""
    JobConfig([misfire_grace_period])

Job default configuration

# Optional arguments
- misfire_grace_period (defaults to Dates.Second(1)): grace period for which a task can still be fired.
"""
mutable struct JobConfig
    misfire_grace_period

    JobConfig(; misfire_grace_period=Dates.Second(1)) = new(misfire_grace_period)
end

mutable struct Job
    id::String
    action::Action
    trigger::AbstractTrigger
    name::String
    priority::Int
    dt_created::DateTime
    dt_updated::DateTime
    #dt_last_fire::DateTime
    dt_next_fire::DateTime
    n_triggered::BigInt
    config::JobConfig
end

"""
    hasnextfire(job)

Returns `true` if a task should be fired in the future.
"""
function hasnextfire(job::Job)
    job.dt_next_fire != DEFAULT_DT_NEXT_FIRE
end
