
[iCE40 UP5k board 개발환경 ](https://www.techrm.com/fpga-ice40up5k-ubuntu-toolchain-first-project-rgb/)

[개발환경 구축](https://www.google.com/search?q=CFU++playground+%EA%B0%9C%EB%B0%9C%ED%99%98%EA%B2%BD+%EA%B5%AC%EC%B6%95%ED%95%98%EA%B8%B0&sca_esv=46f97408aca9b3a8&rlz=1C1CHZN_enKR1141KR1141&biw=1165&bih=910&sxsrf=APpeQnsUJ4RK5sMhZ0IA6w3w_15003f_Fw%3A1782415471462&ei=b4A9atfgG7a1vr0Ps83vkQY&uact=5&sclient=gws-wiz-serp&udm=50&fbs=ABfTbFUgt-aXEFkBhPo84x72c1XofSRswV2oE0pqqIl87uW5B3VC-N9Z5S4Vpdk_1CC5pZknbWfLi3LfkP1I-4mfIh9W9zV7G_dFKFpxr3Gp3r7fTlilQcw3m8XczPohjKXkxJuB8JCmN2CIKxp1-i-nsNpMWnOpzTDF0YX2orWHW7WTVhNdFOj4lP5YuLnuHecLKNe3pgQbJw3nfL-G6jLUq9-KfODI8Q&aep=10&ntc=1&mstk=AUtExfBheEk-1VoC721klLXg9xlUR9U2KB7OQHRiUjrjZCe_fPixjQ-DmnTSonIzLgl50zzhfLIQAwtxgKN1JlB31fnUU9dyZA_4YR-SlRvA5-T2BX7pYOXGUiwlQT2SV4cU-8u3hPxuvc7_9ddfX5dgjXEPta7IgFJzQkihAI3GKDCzAfFMJsJG1Kj4OB0kFTQ-9bb3-Vp4OUA0b8aagVvn322Y8yMG6vBOlI4Go9ZIw5g4m4gegKchB7PI5wE-G6vnvw-2QXmqE9QAWGlTZe6HcaRNl4OszYb_lVK65okB5BUfQseIIZDgoiSmUUU21nTHi5knictLpOo3dg&aioh=3&csuir=1&cs=1&mtid=yYA9aqKgGZKMvr0PjamMmAM)

=> 오류 있음, -conda script 설치 안됨(없음), 

[CFU playground 설치방법 ](https://cfu-playground.readthedocs.io/en/latest/setup-guide.html)

[icesugar fpga tool](https://github.com/wuxx/icesugar)



비트스트림 업데이트 방법 

1) litex_term을 먼저 실행 (reset 누르기 전!):
cd ~/riscv-cfu-int8-dot4-demo/proj/pro_nms_cfu_demo
source ~/riscv-cfu-int8-dot4-demo/environment
python3 -m litex.tools.litex_term /dev/ttyACM0 --kernel build/software.bin

2) 화면에 [LITEX-TERM] Configuring... 또는 대기 상태가 보이면 → 그때 보드 reset 버튼

3) 자동으로 흐름:
- BIOS 부팅 → serialboot 신호 → firmware 자동 업로드 → 부팅
- 메뉴 뜨면 → 3 Enter (Project menu) → 0 Enter (Run demo)

4) 출력:
CPU-only dot product   : cycles = ...
CFU custom instruction : cycles = ...
SPEEDUP = ... x
