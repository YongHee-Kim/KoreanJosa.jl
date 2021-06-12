# KoreanJosa.jl <font size=4>[[한글](README_KR.md)]</font>
![LICENSE MIT](https://img.shields.io/badge/license-MIT-brightgreen.svg?style=flat-square)

Handling Korean [josa(postpositions)](https://en.wikipedia.org/wiki/Korean_postpositions) grammar

this package is inspired by [pyjosa](https://github.com/myevan/pyjosa)

# Usage 
use any of `(이),(가),(과),(와),(을),(를),(은),(는),(으로),(로),(아),(야),(이여),(여),(이라),(라)` inside korean sentence. 
And `KoreanJosa.jl` will choose appropriate korean josa. 

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

