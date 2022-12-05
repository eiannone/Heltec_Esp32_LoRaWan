	.file	"rtc-board.c"
	.text
.Ltext0:

/*============== S U B R O U T I N E ======================================*/
	.section	.text.RtcStopTimeout,"ax",@progbits
	.align	4
	.global	RtcStopTimeout
	.type	RtcStopTimeout, @function
RtcStopTimeout:
    entry   sp, 32
    retw.n
    .size   RtcStopTimeout, .-RtcStopTimeout

/*============== S U B R O U T I N E ======================================*/
	.section	.text.RtcGetTimerContext,"ax",@progbits
	.literal_position
	.literal .LC0, RtcTimerContext    
	.align	4
	.global	RtcGetTimerContext
	.type	RtcGetTimerContext, @function
RtcGetTimerContext:
    entry   sp, 32
    l32r    a8, .LC0
    l32i.n  a2, a8, 0
    l32i.n  a3, a8, 4
    retw.n
    .size   RtcGetTimerContext, .-RtcGetTimerContext

/*============== S U B R O U T I N E ======================================*/
	.section	.text.RtcGetAdjustedTimeoutValue,"ax",@progbits
	.literal_position
	.literal .LC1, McuWakeUpTime    
    .literal .LC2, NonScheduledWakeUp
	.align	4
	.global	RtcGetAdjustedTimeoutValue
	.type	RtcGetAdjustedTimeoutValue, @function
RtcGetAdjustedTimeoutValue:
    entry   sp, 32
    l32r    a8, .LC1
    memw
    l32i.n  a9, a8, 0
    bgeu    a9, a2, loc_74
    l32r    a10, .LC2
    memw
    l8ui    a9, a10, 0
    extui   a9, a9, 0, 8
    beqz.n  a9, loc_74
    movi.n  a9, 0
    memw
    s8i     a9, a10, 0
    memw
    l32i.n  a9, a8, 0
    sub     a2, a2, a9

loc_74:
    memw
    l32i.n  a9, a8, 0
    movi.n  a10, 0x31
    bgeu    a10, a2, loc_89
    bgeu    a9, a2, loc_89
    memw
    l32i.n  a8, a8, 0
    sub     a2, a2, a8

loc_89:
    movi.n  a3, 0
    retw.n
    .size   RtcGetAdjustedTimeoutValue, .-RtcGetAdjustedTimeoutValue

/*============== S U B R O U T I N E ======================================*/
	.section	.text.RtcGetTimerValue,"ax",@progbits
	.literal_position
	.literal .LC3, lastMillis
	.literal .LC4, overflowcnt
	.align	4
	.global	RtcGetTimerValue
	.type	RtcGetTimerValue, @function
RtcGetTimerValue:
    entry   sp, 32
    call8   millis
    l32r    a11, .LC3
    l32r    a8, .LC4
    l32i.n  a9, a11, 0
    bgeu    a10, a9, loc_AA
    l32i.n  a9, a8, 0
    addi.n  a9, a9, 1
    s32i.n  a9, a8, 0

loc_AA:
    s32i.n  a10, a11, 0
    mov.n   a2, a10
    l32i.n  a3, a8, 0
    retw.n
    .size   RtcGetTimerValue, .-RtcGetTimerValue

/*============== S U B R O U T I N E ======================================*/
	.section	.text.RtcSetTimeout,"ax",@progbits
	.literal_position
	.literal .LC5, alarmTime    
	.align	4
	.global	RtcSetTimeout
	.type	RtcSetTimeout, @function
RtcSetTimeout:
    entry   sp, 32
    call8   RtcGetTimerValue
    add.n   a10, a2, a10
    l32r    a9, .LC5
    movi.n  a8, 1
    bltu    a10, a2, loc_C9
    movi.n  a8, 0

loc_C9:
    add.n   a8, a8, a11
    s32i.n  a10, a9, 0
    s32i.n  a8, a9, 4
    retw.n
    .size   RtcSetTimeout, .-RtcSetTimeout

/*============== S U B R O U T I N E ======================================*/
	.section	.text.RtcSetTimerContext,"ax",@progbits
	.literal_position
	.literal .LC6, RtcTimerContext    
	.align	4
	.global	RtcSetTimerContext
	.type	RtcSetTimerContext, @function
RtcSetTimerContext:
    entry   sp, 32
    call8   RtcGetTimerValue
    l32r    a8, .LC6
    mov.n   a2, a10
    s32i.n  a10, a8, 0
    s32i.n  a11, a8, 4
    mov.n   a3, a11
    retw.n
    .size   RtcSetTimerContext, .-RtcSetTimerContext

/*============== S U B R O U T I N E ======================================*/
	.section	.text.RtcGetElapsedTime,"ax",@progbits
	.literal_position
	.literal .LC7, RtcTimerContext       
	.align	4
	.global	RtcGetElapsedTime
	.type	RtcGetElapsedTime, @function
RtcGetElapsedTime:
    entry   sp, 32
    call8   RtcGetTimerValue
    l32r    a3,.LC7
    l32i.n  a2, a3, 0
    l32i.n  a8, a3, 4
    sub     a2, a10, a2
    movi    a3, 1
    bltu    a10, a2, loc_108
    movi    a3, 0

loc_108:
    sub     a11, a11, a8
    sub     a3, a11, a3
    retw.n
    .size   RtcGetElapsedTime, .-RtcGetElapsedTime

/*============== O B J E C T ======================================*/
    .global	McuWakeUpTime
	.section	.bss.McuWakeUpTime,"aw",@nobits
	.align	4
	.type	McuWakeUpTime, @object
	.size	McuWakeUpTime, 4
McuWakeUpTime:
	.zero	4

/*============== O B J E C T ======================================*/
	.global	NonScheduledWakeUp
	.section	.bss.NonScheduledWakeUp,"aw",@nobits
	.type	NonScheduledWakeUp, @object
	.size	NonScheduledWakeUp, 1
NonScheduledWakeUp:
	.zero	1

/*============== O B J E C T ======================================*/
	.global	lastMillis
	.section	.bss.lastMillis,"aw",@nobits
	.align	4
	.type	lastMillis, @object
	.size	lastMillis, 4
lastMillis:
	.zero	4

/*============== O B J E C T ======================================*/
	.global	overflowcnt
	.section	.bss.overflowcnt,"aw",@nobits
	.align	4
	.type	overflowcnt, @object
	.size	overflowcnt, 8
overflowcnt:
	.zero	4

/*============== C O M M O N ======================================*/
	.comm	RtcTimerContext,8,4
    .comm	alarmTime,8,4