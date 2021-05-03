import Base.+

struct LSD
    pounds::Int
    shillings::Int
    pence::Int

    function LSD(l,s,d)
        if l<0 || s<0 || d<0
            error("No negative numbers, please! We're British")
        end
        if d>12 || s>20
            error("That's too many pence or shillings!")
        end
        new(l,s,d)
    end
end

function +(a::LSD, b::LSD)
    newpence = a.pence + b.pence
    newshillings = a.shillings + b.shillings
    newpounds = a.pounds + b.pounds
    subtotal = newpence + newshillings * 12 + newpounds * 240
    (pounds, balance) = divrem(subtotal, 240)
    (shillings, pence) = divrem(balance, 12)
    LSD(pounds, shillings, pence)
end

function Base.show(io::IO, money::LSD)
    print(io, "£$(money.pounds), $(money.shillings)s, $(money.pence)d.")
end

biscuits = LSD(0,1,3)
gravy = LSD(0,0,5)

biscuits + gravy