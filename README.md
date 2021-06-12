# KoreanJosa.jl <font size=4>[[한글](README_KR.md)]</font>
![LICENSE MIT](https://img.shields.io/badge/license-MIT-brightgreen.svg?style=flat-square)
[![Run CI on main](https://github.com/YongHee-Kim/KoreanJosa.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/YongHee-Kim/KoreanJosa.jl/actions/workflows/CI.yml)

Handling Korean [josa(postpositions)](https://en.wikipedia.org/wiki/Korean_postpositions) grammar

this package is inspired by [pyjosa](https://github.com/myevan/pyjosa)

# Usage 
use any of `(이),(가),(과),(와),(을),(를),(은),(는),(으로),(로),(아),(야),(이여),(여),(이라),(라)` inside korean sentence. 
And `KoreanJosa.jl` will choose appropriate korean josa. 

# Examples
```julia
julia> noun = "싸이" 
julia> josa("$noun(은) 가수다.")
"싸이는 가수다."
julia> noun = "방탄소년단" 
julia> josa("$noun(은) 가수다.")	
"방탄소년단은 가수다."
```

```julia
julia> noun = "하늘" 
julia>josa("$noun(이) 파랗다.")	
"하늘이 파랗다."
julia> noun = "바다" 
julia>josa("$noun(이) 파랗다.")	
"바다가 파랗다."	
```

```julia
julia> noun = "라면" 
julia>josa("$noun(을) 먹었다.")	
"라면을 먹었다."
julia> noun = "과자" 
julia>josa("$noun(을) 먹었다.")
"과자를 먹었다."
```	

```julia
julia> noun = "호주" 
julia>josa("$noun(로) 떠납니다.")	
"호주로 떠납니다."
julia> noun = "미국" 
julia>josa("$noun(로) 떠납니다.")	
"미국으로 떠납니다."
```

