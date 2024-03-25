struct Card
    suit :: Int64
    rank :: Int64
    function Card(suit::Int64, rank::Int64)
        @assert(1 ≤ suit ≤ 4, "suit is not between 1 and 4")
        @assert(1 ≤ rank ≤ 13, "rank is not between 1 and 13")
        new(suit, rank)
    end
end

const suit_names = ["♣", "♦", "♥", "♠"]
const rank_names = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]

# card type show method
function Base.show(io::IO, card::Card)
    print(io, rank_names[card.rank], suit_names[card.suit])
end

Card(3,11)

# card type < method
import Base.<
function <(c1::Card, c2::Card)
    (c1.suit, c1.rank) < (c2.suit, c2.rank)
end

# Deck type
struct Deck
    cards :: Array{Card, 1}
end

# Deck constructor
function Deck()
    deck = Deck(Card[])
    for suit in 1:4
        for rank in 1:13
            push!(deck.cards, Card(suit, rank))
        end
    end
    deck
end

# Deck type show method
function Base.show(io::IO, deck::Deck)
    for card in deck.cards
        print(io, card, " ")
    end
    println()
end

Deck()

# add, remove, shuffle and sort
function Base.pop!(deck::Deck)
    pop!(deck.cards)
end

function Base.push!(deck::Deck, card::Card)
    push!(deck.cards, card)
    deck
end

using Random
function Random.shuffle!(deck::Deck)
    shuffle!(deck.cards)
    deck
end

# 18.2
function Base.isless(c1::Card, c2::Card)
    (c1.suit, c1.rank) < (c2.suit, c2.rank)
end
function Base.sort!(deck::Deck)
    Base.sort!(deck.cards)
end

sort!(Deck())