"""
A generally useful event scheduler module.

The `AdvancedScheduler` package provides advanced and extensible [Julia](https://julialang.org/) events schedulers inspired by Python schedulers [APScheduler](https://apscheduler.readthedocs.io/), [schedule](https://github.com/dbader/schedule) and [sched](https://docs.python.org/3/library/sched.html).

Schedulers can use real time clock (system time) or simulated time (for simulation purpose).
"""
module ExtensibleScheduler

    export BlockingScheduler, run_pending
    export Action, add
    export Trigger
    export SimClock, set, NoSleep
    export iterate

    include("priority.jl")
    include("clock/base.jl")
    include("action.jl")
    include("triggers/base.jl")
    include("job.jl")
    include("events.jl")
    include("executors/base.jl")
    include("jobstores/base.jl")
    include("schedulers/base.jl")

end # module
