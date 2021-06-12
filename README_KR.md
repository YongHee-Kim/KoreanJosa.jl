# KoreanJosa.jl <font size=4>[[영문](README.md)]</font>
![LICENSE MIT](https://img.shields.io/badge/license-MIT-brightgreen.svg?style=flat-square)

한글 [조사](https://ko.wikipedia.org/wiki/토씨)처리 패키지입니다

이 패키지는 [pyjosa](https://github.com/myevan/pyjosa)를 참고하여 제작하였습니다

# Usage 

문장에`(이),(가),(과),(와),(을),(를),(은),(는),(으로),(로),(아),(야),(이여),(여),(이라),(라)` 중 1개를 사용하면 앞단어에 맞춰 적절한 조사를 선택해 줍니다  


# Examples
```julia
julia> ko"싸이(은) 가수다."
"싸이는 가수다."
julia> ko"방탄소년단(은) 가수다."	
"방탄소년단은 가수다."
```

```julia
julia>ko"하늘(이) 파랗다."	
"하늘이 파랗다."
julia>ko"바다(이) 파랗다."	
"바다가 파랗다."	
```

```julia
julia>ko"라면(을) 먹었다."	
"라면을 먹었다."
julia>ko"과자(을) 먹었다."
"과자를 먹었다."
```	

```julia
julia>ko"호주(로) 떠납니다."	
"호주로 떠납니다."
julia>ko"미국(로) 떠납니다."	
"미국으로 떠납니다."
```

