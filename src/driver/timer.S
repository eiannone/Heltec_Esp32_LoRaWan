	.file	"timer.c"
	.text
.Ltext0:

/*============== S U B R O U T I N E ======================================*/
	.section	.text.TimeStampsUpdate,"ax",@progbits
	.literal_position
	.literal .LC0, TimerListHead
	.align	4
	.type	TimeStampsUpdate, @function
TimeStampsUpdate:
	entry	sp, 32
	call8   RtcGetTimerContext

	mov.n   a2, a10
	call8   RtcSetTimerContext

	l32r    a8, .LC0
	sub     a11, a10, a2
	l32i.n  a8, a8, 0
	movi.n  a12, 0
	sub     a2, a2, a10

loc_DE:
	bnez.n  a8, loc_E2
	retw.n

loc_E2:
    l32i.n  a10, a8, 0
    mov.n   a9, a12
    bgeu    a11, a10, loc_EC
    add     a9, a2, a10

loc_EC:
    s32i.n  a9, a8, 0
    l32i.n  a8, a8, 0x10
    j       loc_DE

	.size	TimeStampsUpdate, .-TimeStampsUpdate

/*============== S U B R O U T I N E ======================================*/
	.section	.text.TimerInsertNewHeadTimer,"ax",@progbits
	.literal_position
	.literal .LC1, TimerListHead
	.align	4
	.type	TimerInsertNewHeadTimer, @function
TimerInsertNewHeadTimer:
    entry   sp, 32
    l32r    a9, .LC1
    l32i.n  a8, a9, 0
    beqz.n  a8, loc_104

    movi    a10, 0
    s8i     a10, a8, 8

loc_104:
    s32i.n  a8, a2, 0x10
    l32i.n  a10, a2, 0
    movi.n  a8, 1
    s8i     a8, a2, 8
    s32i.n  a2, a9, 0
    call8   RtcSetTimeout
    retw.n
    .size	TimerInsertNewHeadTimer, .-TimerInsertNewHeadTimer

/*============== S U B R O U T I N E ======================================*/
	.section	.text.TimerSetSysTime,"ax",@progbits
	.literal_position
	.literal .LC2, g_systime_ref	
	.align	4
	.global	TimerSetSysTime
	.type	TimerSetSysTime, @function
TimerSetSysTime:
    entry   sp, 48
    s32i.n  a2, a1, 8
    s32i.n  a3, a1, 0xC
    call8   RtcGetTimerValue

    l32i.n  a9, a1, 8
    movi    a8, 0x3E8
    mull    a14, a8, a9
	muluh	a8, a8, a9
    l16si   a9, a1, 0xC
    l32r    a12, .LC2
    srai    a15, a9, 0x1F
    add.n   a9, a14, a9
    movi.n  a13, 1
    bltu    a9, a14, loc_142
    movi.n  a13, 0

loc_142:
    add.n   a8, a8, a15
    sub     a10, a9, a10
    add.n   a8, a13, a8
    movi.n  a13, 1
    bltu    a9, a10, loc_150
    movi.n  a13, 0

loc_150:
    sub     a8, a8, a11
    sub     a8, a8, a13
    s32i.n  a10, a12, 0
    s32i.n  a8, a12, 4
    retw.n
    .size	TimerSetSysTime, .-TimerSetSysTime

/*============== S U B R O U T I N E ======================================*/
	.section	.text.SysTimeGetMcuTime,"ax",@progbits
	.literal_position
	.literal .LC3, 1000
	.literal .LC4, 0
	.align	4
	.global	SysTimeGetMcuTime
	.type	SysTimeGetMcuTime, @function
SysTimeGetMcuTime:
    entry   sp, 48
    call8   RtcGetTimerValue

    l32r    a12, .LC3
    l32r    a13, .LC4
    mov.n   a4, a10
    mov.n   a5, a11
    call8   __udivdi3

    l32r    a12, .LC3
    l32r    a13, .LC4
    mov.n   a2, a10
    mov.n   a11, a5
    or      a10, a4, a4
    call8   __umoddi3

    s16i    a10, a1, 0xC
    l32i.n  a3, a1, 0xC
    retw.n
    .size	SysTimeGetMcuTime, .-SysTimeGetMcuTime

/*============== S U B R O U T I N E ======================================*/
	.section	.text.SysTimeToMs,"ax",@progbits
	.literal_position
	.literal .LC5, g_systime_ref
	.align	4
	.global	SysTimeToMs
	.type	SysTimeToMs, @function
SysTimeToMs:
    entry   sp, 48
    movi    a8, 0x3E8
    mull    a2, a8, a2
    l32r    a8, .LC5
    sext    a3, a3, 0xF
    l32i.n  a8, a8, 0
    add.n   a2, a2, a3
    sub     a2, a2, a8
    retw.n
    .size   SysTimeToMs, .-SysTimeToMs

/*============== S U B R O U T I N E ======================================*/
	.section	.text.SysTimeFromMs,"ax",@progbits
	.literal_position
	.literal .LC6, g_systime_ref
	.literal .LC7, 1000
	.literal .LC8, 0
	.align	4
	.global	SysTimeFromMs
	.type	SysTimeFromMs, @function
SysTimeFromMs:
    entry   sp, 48
    l32r    a3, .LC6
    movi.n  a8, 1
    l32i.n  a4, a3, 0
    l32i.n  a3, a3, 4
    sub     a4, a2, a4
    bltu    a2, a4, loc_1BC
    movi.n  a8, 0

loc_1BC:
    neg     a3, a3
    sub     a3, a3, a8
    l32r    a12, .LC7
    l32r    a13, .LC8
    or      a10, a4, a4
    or      a11, a3, a3
    call8   __udivdi3

    l32r    a12, .LC7
    l32r    a13, .LC8
    mov.n   a2, a10
    or      a11, a3, a3
    or      a10, a4, a4
    call8   __umoddi3

    s16i    a10, a1, 0xC
    l32i.n  a3, a1, 0xC
    retw.n
    .size   SysTimeFromMs, .-SysTimeFromMs

/*============== S U B R O U T I N E ======================================*/
	.section	.text.TimerInit,"ax",@progbits
	.align	4
	.global	TimerInit
	.type	TimerInit, @function
TimerInit:
    entry   sp, 32
    movi.n  a8, 0
    s32i.n  a8, a2, 0
    s32i.n  a8, a2, 4
    s8i     a8, a2, 8
    s32i.n  a3, a2, 0xC
    s32i.n  a8, a2, 0x10
    retw.n
    .size   TimerInit, .-TimerInit

/*============== S U B R O U T I N E ======================================*/
	.section	.text.TimerStart,"ax",@progbits
	.literal_position
	.literal .LC9, TimerListHead
	.align	4
	.global	TimerStart
	.type	TimerStart, @function
TimerStart:
    entry   sp, 32
    call8   BoardDisableIrq
    beqz.n  a2, loc_230

    l32r    a3, .LC9
    l32i.n  a9, a3, 0
    mov.n   a8, a9

loc_216:
    bnez.n  a8, loc_238
    l32i.n  a4, a2, 4
    s8i     a8, a2, 8
    s32i.n  a4, a2, 0
    bnez    a9, loc_240
    call8   RtcSetTimerContext

loc_228:
    mov.n   a10, a2
    call8   TimerInsertNewHeadTimer

loc_230:
    call8   BoardEnableIrq
    retw.n

loc_238:
    beq     a2, a8, loc_230
    l32i.n  a8, a8, 0x10
    j       loc_216

loc_240:
    call8   RtcGetElapsedTime
    l32i.n  a11, a2, 0
    mov.n   a4, a10
    add.n   a11, a4, a11
    l32i.n  a8, a3, 0
    s32i.n  a11, a2, 0
    l32i    a3, a8, 0
    bgeu    a11, a3, loc_266
    call8   RtcGetElapsedTime
    l32i.n  a8, a2, 0
    sub     a8, a8, a4
    s32i.n  a8, a2, 0
    j       loc_228

loc_266:
    l32i.n  a9, a8, 0x10

loc_268:
    l32i.n  a3, a8, 0x10
    bnez.n  a3, loc_274
    s32i.n  a2, a8, 0x10
    s32i.n  a3, a2, 0x10
    j       loc_230

loc_274:
    l32i.n  a3, a9, 0
    bgeu    a3, a11, loc_280
    mov.n   a8, a9
    l32i.n  a9, a9, 0x10
    j       loc_268

loc_280:
    s32i.n  a2, a8, 0x10
    s32i.n  a9, a2, 0x10
    j       loc_230
    .size   TimerStart, .-TimerStart


/*============== S U B R O U T I N E ======================================*/
	.section	.text.TimerIrqHandler,"ax",@progbits
	.literal_position
	.literal .LC10, TimerListHead	
	.align	4
	.global	TimerIrqHandler
	.type	TimerIrqHandler, @function
TimerIrqHandler:
    entry   sp, 32
    call8   TimeStampsUpdate
    l32r    a2, .LC10

loc_294:
    l32i.n  a3, a2, 0
    bnez.n  a3, loc_2B4

loc_298:
    l32i.n  a2, a2, 0
    bnez.n  a2, loc_2D9

loc_29C:
    retw.n

loc_2A1:
    callx8  a8
    movi    a8, 0
    s8i     a8, a3, 8
    call8   TimeStampsUpdate
    j       loc_294

loc_2B4:
    l32i.n  a3, a3, 0
    call8   RtcGetElapsedTime
    bnez.n  a11, loc_2C8
    bltu    a3, a10, loc_2C8
    l32i.n  a3, a2, 0
    l32i.n  a3, a3, 0
    bnez    a3, loc_298

loc_2C8:
    l32i.n  a3, a2, 0
    l32i.n  a8, a3, 0x10
    s32i.n  a8, a2, 0
    l32i.n  a8, a3, 0xC
    bnez    a8, loc_2A1

loc_2D3:
    j       loc_2D3

loc_2D9:
    l8ui    a3, a2, 8
    bnez    a3, loc_29C
    movi.n  a3, 1
    l32i.n  a10, a2, 0
    s8i     a3, a2, 8
    call8   RtcSetTimeout
    j       loc_29C
    .size   TimerIrqHandler, .-TimerIrqHandler

/*============== S U B R O U T I N E ======================================*/
	.section	.text.TimerStop,"ax",@progbits
	.literal_position
	.literal .LC11, TimerListHead
	.align	4
	.global	TimerStop
	.type	TimerStop, @function
TimerStop:
    entry   sp, 32
    call8   BoardDisableIrq
    movi.n  a5, 1
    movi.n  a8, 0
    l32r    a3, .LC11
    moveqz  a8, a5, a2
    extui   a8, a8, 0, 8
    l32i.n  a9, a3, 0
    bnez    a8, loc_310
    moveqz  a8, a5, a9
    beqz.n  a8, loc_319

loc_310:
    call8   BoardEnableIrq
    retw.n

loc_319:
    bne     a9, a2, loc_352
    l8ui    a9, a2, 8
    l32i.n  a4, a2, 0x10
    beqz.n  a9, loc_34B
    beqz.n  a4, loc_345
    s8i     a8, a2, 8
    s32i.n  a4, a3, 0
    call8   TimeStampsUpdate
    l32i.n  a3, a3, 0
    l32i.n  a10, a3, 0
    s8i     a5, a3, 8
    call8   RtcSetTimeout

loc_33D:
    movi.n  a3, 0
    s8i     a3, a2, 8
    j       loc_310

loc_345:
    call8   RtcStopTimeout

loc_34B:
    s32i.n  a4, a3, 0
    j       loc_33D

loc_350:
    mov.n   a9, a3

loc_352:
    l32i.n  a3, a9, 0x10
    beqz    a3, loc_33D
    bne     a2, a3, loc_350
    l32i.n  a3, a2, 0x10
    s32i.n  a3, a9, 0x10
    j       loc_33D
    .size   TimerStop, .-TimerStop

/*============== S U B R O U T I N E ======================================*/
	.section	.text.TimerReset,"ax",@progbits
	.align	4
	.global	TimerReset
	.type	TimerReset, @function
TimerReset:
    entry   sp, 32
    or      a10, a2, a2
    call8   TimerStop
    mov.n   a10, a2
    call8   TimerStart
    retw.n
    .size   TimerReset, .-TimerReset

/*============== S U B R O U T I N E ======================================*/
	.section	.text.TimerSetValue,"ax",@progbits
	.align	4
	.global	TimerSetValue
	.type	TimerSetValue, @function
TimerSetValue:
    entry   sp, 32
    or      a10, a2, a2
    call8   TimerStop
    s32i.n  a3, a2, 0
    s32i.n  a3, a2, 4
    retw.n
    .size   TimerSetValue, .-TimerSetValue

/*============== S U B R O U T I N E ======================================*/
	.section	.text.TimerGetCurrentTime,"ax",@progbits
	.literal_position
	.literal .LC12, g_systime_ref	
	.align	4
	.global	TimerGetCurrentTime
	.type	TimerGetCurrentTime, @function
TimerGetCurrentTime:
    entry   sp, 32
    call8   RtcGetTimerValue
    l32r    a3, .LC12
    l32i.n  a2, a3, 0
    l32i.n  a8, a3, 4
    add.n   a2, a10, a2
    movi.n  a3, 1
    bltu    a2, a10, loc_3A9
    movi.n  a3, 0

loc_3A9:
    add.n   a11, a11, a8
    add.n   a3, a3, a11
    retw.n
    .size   TimerGetCurrentTime, .-TimerGetCurrentTime

/*============== S U B R O U T I N E ======================================*/
	.section	.text.TimerGetSysTime,"ax",@progbits
	.literal_position
	.literal .LC13, 1000
	.literal .LC14, 0
	.align	4
	.global	TimerGetSysTime
	.type	TimerGetSysTime, @function
TimerGetSysTime:
    entry   sp, 48
    call8   TimerGetCurrentTime
    l32r    a12, .LC13
    l32r    a13, .LC14
    mov.n   a4, a10
    mov.n   a5, a11
    call8   __udivdi3
    l32r    a12, .LC13
    l32r    a13, .LC14
    mov.n   a2, a10
    mov.n   a11, a5
    or      a10, a4, a4
    call8   __umoddi3
    s16i    a10, a1, 0xC
    l32i.n  a3, a1, 0xC
    retw.n
    .size   TimerGetSysTime, .-TimerGetSysTime

/*============== S U B R O U T I N E ======================================*/
	.section	.text.TimerGetElapsedTime,"ax",@progbits
	.align	4
	.global	TimerGetElapsedTime
	.type	TimerGetElapsedTime, @function
TimerGetElapsedTime:
    entry   sp, 32
    call8   TimerGetCurrentTime
    sub     a2, a10, a2
    movi.n  a8, 1
    bltu    a10, a2, loc_3F8
    movi    a8, 0

loc_3F8:
    sub     a3, a11, a3
    sub     a3, a3, a8
    retw.n
    .size   TimerGetElapsedTime, .-TimerGetElapsedTime

/*============== S U B R O U T I N E ======================================*/
	.section	.text.TimerTempCompensation,"ax",@progbits
	.align	4
	.global	TimerTempCompensation
	.type	TimerTempCompensation, @function
TimerTempCompensation:
    entry   sp, 32
    retw.n
    .size   TimerTempCompensation, .-TimerTempCompensation

/*============== O B J E C T ======================================*/
	.global	TimerListHead
	.section	.bss.TimerListHead,"aw",@nobits
	.align	4
	.type	TimerListHead, @object
	.size	TimerListHead, 4
TimerListHead:
	.zero	4

/*============== D A T A ======================================*/
	.global	g_systime_ref
	.section	.rtc.data.28,"aw",@progbits
	.align	8
	.type	g_systime_ref, @object
	.size	g_systime_ref, 8
g_systime_ref:
	.zero	8

/*============== O B J E C T ======================================*/
	.global	HasLoopedThroughMain
	.section	.bss.HasLoopedThroughMain,"aw",@nobits
	.type	HasLoopedThroughMain, @object
	.size	HasLoopedThroughMain, 1
HasLoopedThroughMain:
	.zero	1

