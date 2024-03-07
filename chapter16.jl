struct MyTime
    hour
    minute
    second
end

# 16.1 ---------------------------------------------------------------------------------
function printtime(t::MyTime)
    println("$(t.hour):$(t.minute):$(t.second)")
end

#16.2 ----------------------------------------------------------------------------------
function isafter(t1::MyTime, t2::MyTime)
    t1.hour > t2.hour ? true : (t1.minute > t2.minute ? true : (t1.second > t2.second))
end

#16.3, 16.4 ----------------------------------------------------------------------------
function increment(t::MyTime, seconds)
    total_in_seconds = (t.second + t.minute * 60 + t.hour * 3600 ) + seconds 
    total_in_minutes = div(total_in_seconds, 60)

    second = total_in_seconds % 60
    minute = total_in_minutes % 60
    hour = div(total_in_minutes, 60) % 24

    MyTime(hour, minute, second)
end

# 16.5 ---------------------------------------------------------------------------------
function timetoint(t::MyTime)
    total_seconds = t.hour * 3600 + t.minute * 60 + t.second
end

function inttotime(seconds)
    (minutes, second) = divrem(seconds, 60)
    hour, minute = divrem(minutes, 60)
    MyTime(hour, minute, second)
end

function increment_new(t::MyTime, seconds)
    ((t |> timetoint) + seconds) |> inttotime
end