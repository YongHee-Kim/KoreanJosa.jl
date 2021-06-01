module KoreanJosa


# https://github.com/myevan/pyjosa/blob/master/pyjosa.py
# https://github.com/trilliwon/JNaturalKorean/blob/master/Sources/JNaturalKorean/JNaturalKorean.swift

# unicode codepoints
const BASECODE = 44032
const CHOSUNG = 588 # 초성
const JUNGSUNG = 28 # 중성

ALL_JOSA= r".?\([이|가|은|는|을|를|으로|로|아|야|와|과]\)"

# 초성 list
choSungList = ["ㄱ", "ㄲ", "ㄴ", "ㄷ", "ㄸ", "ㄹ", "ㅁ", "ㅂ", "ㅃ", "ㅅ", "ㅆ", "ㅇ", "ㅈ", "ㅉ", "ㅊ", "ㅋ", "ㅌ", "ㅍ", "ㅎ"]
# 중성 list
jungSungList = ["ㅏ", "ㅐ", "ㅑ", "ㅒ", "ㅓ", "ㅔ", "ㅕ", "ㅖ", "ㅗ", "ㅘ", "ㅙ", "ㅚ", "ㅛ", "ㅜ", "ㅝ", "ㅞ", "ㅟ", "ㅠ", "ㅡ", "ㅢ", "ㅣ"]
# 종성 list
jongSungList = [" ", "ㄱ", "ㄲ", "ㄳ", "ㄴ", "ㄵ", "ㄶ", "ㄷ", "ㄹ", "ㄺ", "ㄻ", "ㄼ", "ㄽ", "ㄾ", "ㄿ", "ㅀ", "ㅁ", "ㅂ", "ㅄ", "ㅅ", "ㅆ", "ㅇ", "ㅈ", "ㅊ", "ㅋ", "ㅌ", "ㅍ", "ㅎ"]


abstract type JOSAMarker end 
function JOSAMarker(marker)
    if marker == "(이)" || marker == "(가)"
        JOSA_이_가()
    elseif marker == "(은)" || marker == "(는)"
        JOSA_은_는()
    elseif marker == "(을)" || marker == "(를)"
        JOSA_을_를()
    elseif marker == "(으로)" || marker == "(로)"
        JOSA_으로_로()
    elseif marker == "(아)" || marker == "(야)"
        JOSA_아_야()
    elseif marker == "(와)" || marker == "(과)"
        JOSA_와_과()
    else 
        throw(ArgumentError("\"$(marker)\" is not defined for JOSA"))
    end
end
struct JOSA_이_가 <: JOSAMarker
end 
struct JOSA_은_는 <: JOSAMarker
end 
struct JOSA_을_를 <: JOSAMarker
end 
struct JOSA_으로_로 <: JOSAMarker
end 
struct JOSA_아_야 <: JOSAMarker
end 
struct JOSA_와_과 <: JOSAMarker
end 

# struct JOSA_이_라 
# end 

function josa(sentence::AbstractString)
    # If ther is no 
    if !occursin(ALL_JOSA, s)
        return s 
    end 
    for el in eachmatch(ALL_JOSA, sentence)
        select_josa(el.match)
    end
end

"""
    select_josa()

앞글자(letter) 기준으로 조사 선택
"""
function select_josa(word)
    letter = word[1]
    T = JOSAMarker(word[nextind(word, 1):end])
    select_josa(T, letter)
end
function select_josa(::Type{T}, letter::AbstractString) where T <: JOSAMarker
    char = only(letter)
    char_code = codepoint(char)

    kor_code = char_code - 0xac00 # '가' 이후 한글 코드
    jong_code = kor_code % 28

    # 종성이 없는 경우
    if jong_code == 0
        return josa_pair[1]
    end 
    # 종성이 있는 경우
    if T == JOSA_으로_로
        if jong_code == 8: # ㄹ 종성인 경우
            return josa_pair[1]

    return josa_pair[0]

end

function select_josa(::Type{JOSA_이_가}, i::Integer)
    i == 1 ? "이" : "가"
end



end # module
