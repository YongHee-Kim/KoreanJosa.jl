module KoreanJosa


# https://github.com/myevan/pyjosa/blob/master/pyjosa.py
# https://github.com/trilliwon/JNaturalKorean/blob/master/Sources/JNaturalKorean/JNaturalKorean.swift

# unicode codepoints
const BASECODE = 0xac00 # '가' 이후 한글 코드
const JUNGSUNG = 28 
const ALL_JOSA= r".?\([이|가|과|와|을|를|은|는|으로|로|아|야|이여|여|이라|라]\)"

abstract type JOSAMarker end 
function JOSAMarker(marker)
    if marker == "(이)" || marker == "(가)"
        JOSA_이_가
    elseif marker == "(과)" || marker == "(와)"
        JOSA_과_와
    elseif marker == "(을)" || marker == "(를)"
        JOSA_을_를
    elseif marker == "(은)" || marker == "(는)"
        JOSA_은_는
    elseif marker == "(으로)" || marker == "(로)"
        JOSA_으로_로
    elseif marker == "(아)" || marker == "(야)"
        JOSA_아_야
    elseif marker == "(이여)" || marker == "(여)"
        JOSA_이여_여
    elseif marker == "(이라)" || marker == "(라)"
        JOSA_이라_라
    else 
        throw(ArgumentError("\"$(marker)\" is not defined for JOSA"))
    end
end
struct JOSA_이_가 <: JOSAMarker
end 
struct JOSA_와_과 <: JOSAMarker
end 
struct JOSA_을_를 <: JOSAMarker
end 
struct JOSA_은_는 <: JOSAMarker
end 
struct JOSA_으로_로 <: JOSAMarker
end 
struct JOSA_아_야 <: JOSAMarker
end 
struct JOSA_이여_여 <: JOSAMarker
end 
struct JOSA_이라_라 <: JOSAMarker
end 
function Base.getindex(::Type{JOSA_이_가}, i)
    i == 1 ? "이" : i == 2 ? "가" : throw(KeyError(i))
end
function Base.getindex(::Type{JOSA_와_과}, i)
    i == 1 ? "와" : i == 2 ? "과" : throw(KeyError(i))
end
function Base.getindex(::Type{JOSA_을_를}, i)
    i == 1 ? "을" : i == 2 ? "를" : throw(KeyError(i))
end
function Base.getindex(::Type{JOSA_은_는}, i)
    i == 1 ? "은" : i == 2 ? "는" : throw(KeyError(i))
end
function Base.getindex(::Type{JOSA_으로_로}, i)
    i == 1 ? "으로" : i == 2 ? "로" : throw(KeyError(i))
end
function Base.getindex(::Type{JOSA_아_야}, i)
    i == 1 ? "아" : i == 2 ? "야" : throw(KeyError(i))
end
function Base.getindex(::Type{JOSA_이여_여}, i)
    i == 1 ? "이여" : i == 2 ? "여" : throw(KeyError(i))
end
function Base.getindex(::Type{JOSA_이라_라}, i)
    i == 1 ? "이라" : i == 2 ? "라" : throw(KeyError(i))
end


function josa(s::AbstractString)
    if !occursin(ALL_JOSA, s)
        return s 
    end 
    for el in eachmatch(ALL_JOSA, s)
        x = select_josa(el.match)
        s = replace(s, el.match => x)
    end
    return s
end

"""
    select_josa(word::AbstractString)


"""
function select_josa(word::AbstractString)
    letter = word[1]
    T = JOSAMarker(word[nextind(word, 1):end])
    return letter * select_josa(T, letter)
end
function select_josa(::Type{T}, letter::Char) where T <: JOSAMarker
    char = only(letter)
    char_code = codepoint(char)

    kor_code = char_code - BASECODE 
    jong_code = kor_code % JUNGSUNG

    # 종성이 없는 경우
    if jong_code == 0
        return T[2]
    end 
    # 종성이 있는 경우
    if T == JOSA_으로_로
        if jong_code == 8 # ㄹ 종성인 경우
            return T[2]
        end
    end
        
    return T[1]
end





end # module
