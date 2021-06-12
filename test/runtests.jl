using Test
using KoreanJosa


@testset "Do nothing" begin 
    @test josa("Korean josa system is hard to learn") == "Korean josa system is hard to learn"
    @test josa("1986 + 2021") == "1986 + 2021"
end

@testset "(이), (가)" begin 
    @test josa("이것(이)") == josa("이것(가)") == "이것이"
    @test josa("구글(이)") == josa("구글(가)") == "구글이"
    @test josa("니(이)") == josa("니(가)") == "니가"
    @test josa("누(이)") == josa("누(가)") == "누가"
end

@testset "(과), (와)" begin 
    @test josa("우리(과)") == josa("우리(와)") == "우리와"
    @test josa("아이폰(과)") == josa("아이폰(와)") == "아이폰과"
    @test josa("갤럭시(과)") == josa("갤럭시(와)") == "갤럭시와"
    @test josa("학교(과)") == josa("학교(와)") == "학교와"
end

@testset "(을), (를)" begin 
    @test josa("이것(을)") == josa("이것(를)") == "이것을"
    @test josa("장난(을)") == josa("장난(를)") == "장난을"
    @test josa("고기(을)") == josa("고기(를)") == "고기를"
    @test josa("장소(을)") == josa("장소(를)") == "장소를"
end

@testset "(은), (는)" begin 
    @test josa("왕(은)") == josa("왕(는)") == "왕은"
    @test josa("목숨(은)") == josa("목숨(는)") == "목숨은"
    @test josa("신하(은)") == josa("신하(는)") == "신하는"
    @test josa("자네(은)") == josa("자네(는)") == "자네는"
end

@testset "(으로), (로)" begin 
    @test josa("바다(으로)") == josa("바다(로)") == "바다로"
    @test josa("서울(으로)") == josa("서울(로)") == "서울로"
    @test josa("부산(으로)") == josa("부산(로)") == "부산으로"
    @test josa("대학(으로)") == josa("대학(로)") == "대학으로"
end

@testset "(아), (야)" begin 
    @test josa("수진(아)") == josa("수진(야)") == "수진아"
    @test josa("재석(아)") == josa("재석(야)") == "재석아"
    @test josa("혜미(아)") == josa("혜미(야)") == "혜미야"
    @test josa("용희(아)") == josa("용희(야)") == "용희야"
end

@testset "(이여), (여)" begin 
    @test josa("장사꾼(이여)") == josa("장사꾼(여)") == "장사꾼이여"
    @test josa("학생(이여)") == josa("학생(여)") == "학생이여"
    @test josa("그대(이여)") == josa("그대(여)") == "그대여"
    @test josa("용사(이여)") == josa("용사(여)") == "용사여"
end

@testset "(이라), (라)" begin 
    @test josa("오늘(이라)") == josa("오늘(라)") == "오늘이라"
    @test josa("고놈(이라)") == josa("고놈(라)") == "고놈이라"
    @test josa("모레(이라)") == josa("모레(라)") == "모레라"
    @test josa("제주도(이라)") == josa("제주도(라)") == "제주도라"
end

@testset "All" begin 
    s = "오늘(는) 맑고푸르른 하늘(와) 청명한 바다(을) 보며, 한국(로) 돌아가고 싶(는) 마음에 말(를) 꺼냈다. 혜미(아), 정철(야) 너희(은) 어떻게 생각하니? 글쎄... 선생님(라)면 오랜만(여)서 반가워 하실 것 같아."
    @test josa(s) == "오늘은 맑고푸르른 하늘과 청명한 바다를 보며, 한국으로 돌아가고 싶은 마음에 말을 꺼냈다. 혜미야, 정철아 너희는 어떻게 생각하니? 글쎄... 선생님이라면 오랜만이여서 반가워 하실 것 같아."
end
