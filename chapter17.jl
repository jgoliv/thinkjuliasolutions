using Printf

struct MyTime
    hour::Int64
    minute::Int64
    second::Int64
end

function printtime(t::MyTime)
    @printf("%02d:%02d:%02d", t.hour, t.minute, t.second)
end

start = MyTime(9,45,0)
start |> printtime

function increment(t::MyTime, seconds::Int64)
    seconds += timetoint(t)
    inttotime(seconds)
end

function isafter(t1::MyTime, t2::MyTime)
    (t1.hour, t1.minute, t1.second) > (t2.hour, t2.minute, t2.second)
end

# 17.1 --------------------------------------------------------------------------
function timetoint(t::MyTime)
    total_seconds = t.hour * 3600 + t.minute * 60 + t.second
end

function inttotime(seconds::Int64)
    (minutes, second) = divrem(seconds, 60)
    hour, minute = divrem(minutes, 60)
    MyTime(hour, minute, second)
end

# 17.3 -------------------------------------------------------------------------
import Base.+

struct Point
    x::Float64
    y::Float64
end

function +(p::Point, q::Point)
    Point(p.x + q.x, p.y + q.y)
end

function +(p::Point, t::Tuple{Float64, Float64})
    Point(p.x + t[1], p.y + t[2])
end

p = Point(2,3)
q = Point(2.2, 3.3)
p + (2.2, 3.1)