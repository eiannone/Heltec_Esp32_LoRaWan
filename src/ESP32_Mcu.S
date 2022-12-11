
	.file	"ESP32_Mcu.cpp"
	.text
.Ltext0:
/*============== S U B R O U T I N E ======================================*/
    .section    .text._Z13FLASH_read_atjPhj,"ax",@progbits
    .align  4
    .type   _Z13FLASH_read_atjPhj, @function
/* _DWORD __fastcall FLASH_read_at(unsigned int, unsigned __int8 *, unsigned int) */
_Z13FLASH_read_atjPhj:
    entry   sp, 32
    mov.n   a12, a4
    mov.n   a11, a3
    or      a10, a2, a2
    call8   spi_flash_read
    retw.n
    .size   _Z13FLASH_read_atjPhj, .-_Z13FLASH_read_atjPhj

/*============== S U B R O U T I N E ======================================*/
	.section	.rodata._Z17getLicenseAddressv.str1.1,"aMS",@progbits,1
.LC0:
	.string	"app1"
    .section    .text._Z17getLicenseAddressv,"ax",@progbits
	.literal_position
	.literal .LC1, .LC0
    .literal .LC2, license_addr
    .literal .LC3, isfirstRun_ADDR
    .literal .LC4, 0xFFFFE001
    .literal .LC5, PARA_ADDR_BASE
    .align  4
    .global _Z17getLicenseAddressv
    .type   _Z17getLicenseAddressv, @function
/* _DWORD getLicenseAddress(void)  */
_Z17getLicenseAddressv:
    entry   sp, 32
    l32r    a12, .LC1
    movi.n  a11, 0x11
    movi.n  a10, 0
    call8   esp_partition_find
    call8   esp_partition_get
    l32i.n  a9, a10, 0x10
    l32i.n  a8, a10, 0xC
    add.n   a8, a8, a9
    l32r    a9, .LC2
    addmi   a10, a8, -0x1000
    s32i.n  a10, a9, 0
    l32r    a9, .LC3
    addmi   a10, a8, -0x2000
    s32i.n  a10, a9, 0
    l32r    a9, .LC4
    add.n   a8, a8, a9
    l32r    a9, .LC5
    s32i.n  a8, a9, 0
    retw.n
    .size   _Z17getLicenseAddressv, .-_Z17getLicenseAddressv

/*============== S U B R O U T I N E ======================================*/
    .section    .text._Z12writelicensev,"ax",@progbits
	.literal_position
    .literal .LC6, license_addr    
    .literal .LC7, 0x1000
    .literal .LC8, storedlicense
    .align  4
    .global _Z12writelicensev
    .type   _Z12writelicensev, @function
/* _DWORD writelicense(void) */
_Z12writelicensev:
    entry   sp, 32
    l32r    a2, .LC6
    l32r    a11, .LC7
    l32i.n  a10, a2, 0
    call8   spi_flash_erase_range
    l32r    a11, .LC8
    l32i.n  a10, a2, 0
    movi.n  a12, 0x10
    call8   spi_flash_write
    retw.n
    .size   _Z12writelicensev, .-_Z12writelicensev

/*============== S U B R O U T I N E ======================================*/
    .section    .text._Z11readlicensev,"ax",@progbits
	.literal_position
    .literal .LC9, license_addr
    .literal .LC10, storedlicense
    .align  4
    .global _Z11readlicensev
    .type   _Z11readlicensev, @function
/* _DWORD readlicense(void) */
_Z11readlicensev:
    entry   sp, 32
    l32r    a8, .LC9
    l32r    a11, .LC10
    l32i.n  a10, a8, 0
    movi    a12, 0x10
    call8   spi_flash_read
    retw.n
    .size   _Z11readlicensev, .-_Z11readlicensev

/*============== S U B R O U T I N E ======================================*/
    .section    .text._Z6calRTCv,"ax",@progbits
	.literal_position
    .literal .LC11, ESP
    .literal .LC12, 0xFFFF0000
    .literal .LC13, 0x7F94C959
    .literal .LC14, 0x0F0F0F0F
    .literal .LC15, 0xF0F0F0F0
    .literal .LC16, 0x0A4E384E
    .literal .LC17, 0x33333333
    .literal .LC18, 0xCCCCCCCC
    .literal .LC19, 0x572384DC
    .literal .LC20, 0x55555555
    .literal .LC21, 0xAAAAAAAA
    .literal .LC22, 0x00FF00FF
    .literal .LC23, 0xFF00FF00
    .literal .LC24, correctlicense
    .literal .LC25, 0x000F0000
    .literal .LC26, 0xFFF0FFFF
    .literal .LC27, 0x394BBD41
    .literal .LC28, 0x3FACF646
    .literal .LC29, 0x7E799942
    .literal .LC30, 0x414DE9DA
    .literal .LC31, 0x0F000000
    .literal .LC32, 0xF0FFFF0F
    .literal .LC33, 0xB2F6B12D
    .literal .LC34, 0x1BEDC3B2
    .literal .LC35, 0xF5941F73
    .literal .LC36, 0x73E9AEDB
    .literal .LC37, 0xFFFFF0FF
    .literal .LC38, 0xF00
    .literal .LC39, 0x237CE438
    .literal .LC40, 0xD9C7DE39
    .literal .LC41, 0x41EC0F9A
    .literal .LC42, storedlicense
    .literal .LC43, 0x28C6C100
    .align  4
    .global _Z6calRTCv
    .type   _Z6calRTCv, @function
/* _DWORD calRTC(void) */
_Z6calRTCv:
    entry   sp, 48
    l32r    a10, .LC11
    call8   _ZN8EspClass11getEfuseMacEv
    slli    a3, a11, 0x10
    extui   a2, a10, 0x10, 0x10
    or      a2, a3, a2
    l32r    a3, .LC12
    and     a3, a2, a3
    add.n   a10, a3, a10
    movi.n  a2, 1
    bltu    a10, a3, loc_2A5
    movi    a2, 0

loc_2A5:
    add.n   a2, a2, a11
    extui   a11, a11, 0, 0x10
    sub     a11, a10, a11
    movi.n  a3, 1
    bltu    a10, a11, loc_2B4
    movi.n  a3, 0

loc_2B4:
    sub     a2, a2, a3
    slli    a2, a2, 0x10
    extui   a13, a11, 0x10, 0x10
    l32r    a3, .LC13
    or      a13, a2, a13
    l32r    a5, .LC14
    l32r    a4, .LC15
    add.n   a3, a13, a3
    srli    a2, a3, 4
    slli    a3, a3, 4
    and     a3, a3, a4
    and     a2, a2, a5
    or      a2, a2, a3
    l32r    a3, .LC16
    l32r    a15, .LC17
    l32r    a14, .LC18
    add.n   a2, a2, a3
    srli    a3, a2, 2
    slli    a2, a2, 2
    l32r    a8, .LC19
    and     a2, a2, a14
    and     a3, a3, a15
    or      a3, a3, a2
    l32r    a7, .LC20
    l32r    a6, .LC21
    add.n   a3, a3, a8
    srli    a2, a3, 1
    slli    a3, a3, 1
    and     a3, a3, a6
    and     a2, a2, a7
    or      a2, a2, a3
    sub     a2, a2, a8
    l32r    a3, .LC22
    srli    a9, a2, 8
    slli    a8, a2, 8
    l32r    a2, .LC23
    and     a9, a9, a3
    and     a8, a8, a2
    or      a8, a9, a8
    l32r    a9, .LC24
    l32r    a10, .LC25
    s32i.n  a8, a9, 0
    l32r    a9, .LC26
    s32i.n  a8, a1, 0xC
    slli    a8, a11, 4
    and     a8, a8, a10
    and     a9, a13, a9
    or      a9, a8, a9
    l32r    a8, .LC27
    movi.n  a10, -1
    add.n   a9, a9, a8
    srli    a8, a9, 8
    slli    a9, a9, 8
    and     a9, a9, a2
    and     a8, a8, a3
    or      a8, a8, a9
    l32r    a9, .LC28
    l32r    a12, .LC29
    add.n   a8, a8, a9
    srli    a9, a8, 2
    xor     a8, a10, a8
    slli    a8, a8, 2
    and     a9, a9, a15
    and     a8, a8, a14
    or      a8, a9, a8
    l32r    a9, .LC30
    add.n   a8, a8, a9
    xor     a9, a10, a8
    srli    a9, a9, 4
    slli    a8, a8, 4
    and     a9, a9, a5
    and     a8, a8, a4
    or      a8, a9, a8
    add.n   a8, a8, a12
    srli    a12, a8, 1
    slli    a8, a8, 1
    and     a8, a8, a6
    and     a12, a12, a7
    or      a12, a12, a8
    l32r    a8, .LC24
    slli    a9, a11, 0x10
    s32i.n  a12, a8, 4
    l32r    a8, .LC31
    and     a9, a9, a8
    l32r    a8, .LC32
    and     a8, a13, a8
    or      a9, a9, a8
    movi    a8, 0xF0
    and     a8, a11, a8
    or      a8, a8, a9
    l32r    a9, .LC33
    slli    a11, a11, 8
    add.n   a8, a8, a9
    xor     a9, a10, a8
    srli    a9, a9, 8
    slli    a8, a8, 8
    and     a8, a8, a2
    and     a9, a9, a3
    or      a9, a9, a8
    l32r    a8, .LC34
    add.n   a9, a9, a8
    srli    a8, a9, 4
    xor     a9, a10, a9
    slli    a9, a9, 4
    and     a9, a9, a4
    and     a8, a8, a5
    or      a8, a8, a9
    l32r    a9, .LC35
    add.n   a8, a8, a9
    xor     a8, a10, a8
    srli    a9, a8, 2
    slli    a8, a8, 2
    and     a8, a8, a14
    and     a9, a9, a15
    or      a9, a9, a8
    l32r    a8, .LC36
    add.n   a9, a9, a8
    srli    a8, a9, 1
    slli    a9, a9, 1
    and     a9, a9, a6
    and     a8, a8, a7
    or      a8, a8, a9
    l32r    a9, .LC24
    s32i.n  a8, a9, 8
    l32r    a9, .LC37
    and     a13, a13, a9
    l32r    a9, .LC38
    and     a11, a11, a9
    or      a13, a11, a13
    xor     a9, a10, a13
    srli    a9, a9, 1
    slli    a13, a13, 1
    and     a6, a13, a6
    and     a7, a9, a7
    or      a7, a7, a6
    l32r    a6, .LC39
    add.n   a7, a7, a6
    srli    a6, a7, 4
    xor     a7, a10, a7
    slli    a7, a7, 4
    and     a4, a7, a4
    and     a5, a6, a5
    or      a5, a5, a4
    l32r    a4, .LC40
    add.n   a5, a5, a4
    xor     a4, a10, a5
    srli    a4, a4, 8
    slli    a5, a5, 8
    and     a3, a4, a3
    and     a2, a5, a2
    or      a2, a3, a2
    l32r    a3, .LC41
    l32i.n  a5, a1, 0xC
    add.n   a2, a2, a3
    xor     a10, a10, a2
    srli    a2, a10, 2
    slli    a10, a10, 2
    and     a15, a2, a15
    and     a14, a10, a14
    or      a14, a15, a14
    l32r    a3, .LC42
    l32r    a15, .LC43
    l32r    a2, .LC24
    add.n   a14, a14, a15
    l32i.n  a4, a3, 0
    s32i.n  a14, a2, 0xC
    movi.n  a2, 0
    bne     a4, a5, loc_4A8

    l32i.n  a4, a3, 4
    bne     a4, a12, loc_4A8

    l32i.n  a4, a3, 8
    bne     a4, a8, loc_4A8

    l32i.n  a15, a3, 0xC
    movi.n  a3, 1
    sub     a14, a15, a14
    moveqz  a2, a3, a14

loc_4A8:
    retw.n
    .size   _Z6calRTCv, .-_Z6calRTCv

/*============== S U B R O U T I N E ======================================*/
    .section    .text.getID,"ax",@progbits
	.literal_position
    .literal .LC44, ESP    
    .align  4
    .global getID
    .type   getID, @function
getID:
    entry   sp, 32
    l32r    a10, .LC44
    call8   _ZN8EspClass11getEfuseMacEv
    mov.n   a2, a10
    mov.n   a3, a11
    retw.n
    .size   getID, .-getID

/*============== S U B R O U T I N E ======================================*/
    .section    .text._ZN8McuClassC2Ev,"ax",@progbits
    .literal_position
    .literal .LC45, 0x7A1200
    .align  4
    .global _ZN8McuClassC2Ev
    .type   _ZN8McuClassC2Ev, @function
/* McuClass *McuClass::McuClass(McuClass *__hidden this) */
_ZN8McuClassC2Ev:
    entry   sp, 32
    l32r    a8, .LC45
    s32i.n  a8, a2, 0
    movi.n  a8, 1
    s16i    a8, a2, 4
    retw.n
    .size   _ZN8McuClassC2Ev, .-_ZN8McuClassC2Ev

/*============== S U B R O U T I N E ======================================*/
    .section    .text._ZN8McuClass15setSPIFrequencyEj,"ax",@progbits
    .align  4
    .global _ZN8McuClass15setSPIFrequencyEj
    .type   _ZN8McuClass15setSPIFrequencyEj, @function
/* _DWORD __fastcall McuClass::setSPIFrequency(McuClass *__hidden this, unsigned int) */
_ZN8McuClass15setSPIFrequencyEj:
    entry   sp, 32
    extui   a8, a3, 8, 8
    s8i     a3, a2, 0
    s8i     a8, a2, 1
    extui   a8, a3, 0x10, 8
    extui   a3, a3, 0x18, 8
    s8i     a3, a2, 3
    movi.n  a3, 1
    s8i     a3, a2, 4
    movi.n  a3, 0
    s8i     a8, a2, 2
    s8i     a3, a2, 5
    retw.n
    .size   _ZN8McuClass15setSPIFrequencyEj, .-_ZN8McuClass15setSPIFrequencyEj

/*============== S U B R O U T I N E ======================================*/
    .section    .text.SpiInOut,"ax",@progbits
    .literal_position
    .literal .LC46, SPI
    .align  4
    .global SpiInOut
    .type   SpiInOut, @function
SpiInOut:
    entry   sp, 32
    l32r    a10, .LC46
    extui   a11, a3, 0, 8
    call8   _ZN8SPIClass8transferEh
    mov.n   a2, a10
    retw.n
    .size   SpiInOut, .-SpiInOut

/*============== S U B R O U T I N E ======================================*/
    .section    .text.timercheck,"ax",@progbits
	.literal_position
    .literal .LC47, 0xE7E1FAFB
    .literal .LC48, 0x85C3
    .align  4
    .global timercheck
    .type   timercheck, @function
timercheck:
    entry   sp, 32
    l32r    a2, .LC47
    l32r    a3, .LC48
    retw.n
    .size   timercheck, .-timercheck

/*============== S U B R O U T I N E ======================================*/
    .section    .text.startup._GLOBAL__sub_I_timer,"ax",@progbits
    .literal_position
    .literal .LC49, Mcu
    .literal .LC50, 8000000
    .align  4
    .type   _GLOBAL__sub_I_timer, @function
_GLOBAL__sub_I_timer:
    entry   sp, 32
    l32r    a8, .LC49
    l32r    a9, .LC50
    s32i.n  a9, a8, 0
    movi.n  a9, 1
    s16i    a9, a8, 4
    retw.n
    .size   _GLOBAL__sub_I_timer, .-_GLOBAL__sub_I_timer

	.section	.ctors,"aw",@progbits
	.align	4
	.word	_GLOBAL__sub_I_timer

/*============== S U B R O U T I N E ======================================*/
    .section    .text.lora_printf,"ax",@progbits
    .literal_position
    .literal .LC51, __stack_chk_guard
    .literal .LC52, Serial
    .align  4
    .global lora_printf
    .type   lora_printf, @function
lora_printf:
    entry   sp, 0xA0
    s32i.n  a4, a1, 8
    l32r    a4, .LC51
    s32i.n  a5, a1, 0xC
    s32i.n  a3, a1, 4
    s32i.n  a6, a1, 0x10
    s32i.n  a7, a1, 0x14
    memw
    l32i.n  a3, a4, 0
    movi.n  a11, 0
    memw
    s32i    a3, a1, 0x7C
    mov.n   a3, a1
    s32i.n  a3, a1, 0x28
    movi    a3, 0x80
    add.n   a13, a1, a3
    movi.n  a15, 4
    mov.n   a3, a1
    mov.n   a14, a1
    mov.n   a12, a2
    mov.n   a10, a11
    s32i.n  a3, a1, 0x34
    s32i.n  a13, a1, 0x24
    s32i.n  a15, a1, 0x2C
    s32i.n  a13, a1, 0x30
    s32i.n  a15, a1, 0x38
    call8   vsnprintf
    movi.n  a8, 0x3F
    addi.n  a5, a10, 1
    addi    a3, a1, 0x3C
    bgeu    a8, a10, loc_580
    mov.n   a10, a5
    call8   _Znaj
    mov.n   a3, a10

loc_580:
    l32i.n  a13, a1, 0x24
    l32i.n  a14, a1, 0x28
    l32i.n  a15, a1, 0x2C
    mov.n   a12, a2
    mov.n   a11, a5
    mov.n   a10, a3
    call8   vsnprintf
    mov.n   a12, a10
    mov.n   a2, a10
    l32r    a10, .LC52
    or      a11, a3, a3
    movi    a5, 0x40
    call8   _ZN14HardwareSerial5writeEPKhj
    bgeu    a5, a2, loc_5B0
    mov.n   a10, a3
    call8   _ZdaPv

loc_5B0:
    memw
    l32i    a3, a1, 0x7C
    memw
    l32i.n  a2, a4, 0
    beq     a3, a2, loc_5C4
    call8   __stack_chk_fail

loc_5C4:
    retw.n
    .size   lora_printf, .-lora_printf

/*============== S U B R O U T I N E ======================================*/
	.section	.rodata._ZN8McuClass5beginEv.str1.1,"aMS",@progbits,1
aPleaseProvideA:
	.string	"Please provide a correct license! For more information:\r\n"
aHttpWwwHeltecC:
    .string "http://www.heltec.cn/search/\r\n"
aEsp32chipid04x:
    .string "ESP32ChipID=%04X"
a08x:
    .string "%08X\r\n"
aTheBoardIsActi:
    .string "The board is actived"

    .section    .text._ZN8McuClass5beginEv,"ax",@progbits
    .literal_position
    .literal .LC53, __stack_chk_guard
    .literal .LC54, ESP
    .literal .LC55, aPleaseProvideA
    .literal .LC56, aHttpWwwHeltecC
    .literal .LC57, Serial
    .literal .LC58, aEsp32chipid04x
    .literal .LC59, a08x
    .literal .LC60, storedlicense
    .literal .LC61, aTheBoardIsActi
    .literal .LC62, SPI
    .align  4
    .global _ZN8McuClass5beginEv
    .type   _ZN8McuClass5beginEv, @function
/* _DWORD McuClass::begin(McuClass *__hidden this) */
_ZN8McuClass5beginEv:
    entry   sp, 0x80
    l32r    a4, .LC53
    memw
    l32i    a3, a4, 0
    memw
    s32i    a3, a1, 0x5C
/*    call8   _Z17getLicenseAddressv*/
/*    call8   _Z11readlicensev*/
/*    call8   _Z6calRTCv*/
/*    bnei    a10, 1, loc_676*/
    j       loc_798

/* --------------------------------------------------------------------------- */
loc_676:
    l32r    a10, .LC54
    movi    a6, 0
    call8   _ZN8EspClass11getEfuseMacEv

    or      a4, a10, a10
    l32r    a10, .LC55
    mov.n   a5, a11
    call8   lora_printf
    l32r    a10, .LC56
    call8   lora_printf
    l32r    a3, .LC57
    l32r    a11, .LC58
    extui   a12, a5, 0, 0x10
    mov.n   a10, a3
    call8   _ZN5Print6printfEPKcz
    l32r    a11, .LC59
    or      a12, a4, a4
    mov.n   a10, a3
    call8   _ZN5Print6printfEPKcz
    movi.n  a4, 0x29

loc_6BA:
    call8   millis
    or      a7, a10, a10
    or      a10, a3, a3
    call8   _ZN14HardwareSerial5flushEv
    mov.n   a5, a6

loc_6CE:
    call8   millis
    sub     a10, a10, a7
    movi    a8, 0x3E7
    bltu    a8, a10, loc_6FF
    mov.n   a10, a3
    call8   _ZN14HardwareSerial9availableEv
    blti    a10, 1, loc_6FC
    or      a10, a3, a3
    call8   _ZN14HardwareSerial4readEv
    addi    a8, a1, 0x2A
    add.n   a9, a8, a5
    s8i     a10, a9, 0
    addi    a5, a5, 1

loc_6FC:
    bne     a5, a4, loc_6CE

loc_6FF:
    addi    a8, a1, 0x2A
    add.n   a7, a8, a5
    movi.n  a9, 0
    s8i     a9, a7, 0
    bne     a5, a4, loc_6BA
    l8ui    a8, a1, 0x32
    movi.n  a7, 0x3D
    bne     a8, a7, loc_6BA
    addi.n  a9, a1, 0xA
    addi    a11, a1, 0x2A
    mov.n   a7, a9
    movi    a12, 0x60
    movi.n  a13, 0x39
    movi.n  a10, 32
    loop    a10, loc_74A
    l8ui    a8, a11, 9
    bgeu    a12, a8, loc_72E
    j       loc_7F5

/* --------------------------------------------------------------------------- */
loc_72E:
    s8i     a8, a7, 0
    l8ui    a8, a7, 0
    addi    a14, a8, -0x37
    extui   a14, a14, 0, 8
    bltu    a13, a8, loc_743
    addi    a8, a8, -0x30
    extui   a14, a8, 0, 8

loc_743:
    s8i     a14, a7, 0
    addi.n  a11, a11, 1
    addi.n  a7, a7, 1

loc_74A:
    l32r    a8, .LC60
    movi    a7, 0

loc_750:
    mov.n   a13, a9
    movi.n  a12, 0x1C
    movi.n  a10, 0
    movi    a11, 8
    loop    a11, loc_76D
    l8ui    a14, a13, 0
    addi.n  a13, a13, 1
    ssl     a12
    sll     a14, a14
    or      a10, a10, a14
    addi    a12, a12, -4

loc_76D:
    s32i.n  a10, a8, 0
    addi    a7, a7, 1
    addi    a8, a8, 4
    addi    a9, a9, 8
    bnei    a7, 4, loc_750
    call8   _Z6calRTCv
    beqi    a10, 1, loc_787
    j       loc_6BA

/* --------------------------------------------------------------------------- */
loc_787:
    call8   _Z12writelicensev
    l32r    a11, .LC61
    mov.n   a10, a3
    call8   _ZN5Print7printlnEPKc

loc_798:
    l32r    a4, .LC62
    movi.n  a14, -1
    movi.n  a13, 0x1B
    mov.n   a10, a4
    movi.n  a12, 0x13
    movi.n  a11, 5
    movi.n  a5, 0x12
    call8   _ZN8SPIClass5beginEaaaa
    s8i     a5, a2, 1
    movi    a5, 0x7A
    s8i     a5, a2, 2
    movi.n  a5, 1
    movi.n  a3, 0
    s8i     a5, a2, 4
    movi.n  a5, 0
    s8i     a3, a2, 0
    s8i     a3, a2, 3
    s8i     a5, a2, 5
    l32i.n  a11, a2, 0
    l32i.n  a12, a2, 4
    mov.n   a10, a4
    call8   _ZN8SPIClass16beginTransactionE11SPISettings
    mov.n   a10, a4
    call8   _ZN8SPIClass14endTransactionEv
    l32r    a5, .LC53
    mov.n   a2, a3
    memw
    l32i    a4, a1, 0x5C
    memw
    l32i.n  a3, a5, 0
    beq     a4, a3, loc_7FC
    call8   __stack_chk_fail

loc_7F5:
    addi    a8, a8, -0x20
    j       loc_72E

/* --------------------------------------------------------------------------- */
loc_7FC:
    retw.n
    .size   _ZN8McuClass5beginEv, .-_ZN8McuClass5beginEv


/*============== S U B R O U T I N E ======================================*/
	.section	.rodata.str1.1
aDeepSleepUntil:
	.string	"Deep Sleep until Next TxPacket:%d ms\r\n"

    .section    .text._ZN8McuClass5sleepEhh,"ax",@progbits
	.literal_position
    .literal .LC63, alarmTime
	.literal .LC64, TimerListHead
	.literal .LC65, TxNextPacketTimer
    .literal .LC66, IsLoRaMacNetworkJoined
	.literal .LC67, toDeepSleep
    .literal .LC68, aDeepSleepUntil
    .literal .LC69, g_systime_ref
    .align  4
    .global _ZN8McuClass5sleepEhh
    .type   _ZN8McuClass5sleepEhh, @function
/* McuClass::sleep(unsigned char, unsigned char) */
_ZN8McuClass5sleepEhh:
    entry   sp, 32
    extui   a3, a3, 0, 8
    extui   a4, a4, 0, 8
    beqz    a3, loc_879

loc_834:
    l32r    a2, .LC63

loc_837:
    call8   RtcGetTimerValue
    l32i.n  a3, a2, 4
    bgeu    a11, a3, loc_845
    j       loc_98E
/*---------------------------------------------------------------------------*/

loc_845:
    bne     a3, a11, loc_851
    l32i    a3, a2, 0
    bgeu    a10, a3, loc_851
    j       loc_98E
/*---------------------------------------------------------------------------*/

loc_851:
    call8   RtcGetTimerValue
    l32i.n  a3, a2, 4
    bltu    a11, a3, loc_8A0
    bne     a3, a11, loc_865
    l32i    a2, a2, 0
    bltu    a10, a2, loc_8A0

loc_865:
/*    call8   _Z6calRTCv*/
/*    bnei    a10, 1, loc_8A0*/
    call8   TimerIrqHandler
    j       loc_8A0
/*---------------------------------------------------------------------------*/

loc_879:
    l32r    a2, .LC64
    l32r    a3, .LC65
    l32i.n  a2, a2, 0
    bne     a2, a3, loc_834

    l32i.n  a5, a2, 0x10
    bnez    a5, loc_834

    l32r    a2, .LC66
    l8ui    a2, a2, 0
    beqz    a2, loc_834

    l32r    a3, .LC67
    l8ui    a2, a3, 0
    bgeui   a2, 5, loc_8A5

    addi.n  a2, a2, 1
    s8i     a2, a3, 0

loc_8A0:
    retw.n
/*---------------------------------------------------------------------------*/

loc_8A5:
    call8   RtcGetTimerValue
    l32r    a3, .LC63
    movi.n  a9, 1
    l32i.n  a12, a3, 0
    l32i.n  a8, a3, 4
    sub     a3, a12, a10
    bltu    a12, a3, loc_8BC
    mov.n   a9, a5

loc_8BC:
    sub     a2, a8, a11
    movi    a8, -0x3E9
    add.n   a8, a3, a8
    sub     a2, a2, a9
    movi.n  a9, 1
    bltu    a8, a3, loc_8CE
    movi.n  a9, 0

loc_8CE:
    addi.n  a5, a2, -1
    add.n   a9, a9, a5
    bnez    a9, loc_834
    movi    a5, -0x3EB
    bgeu    a5, a8, loc_8DE
    j       loc_834
/*---------------------------------------------------------------------------*/

loc_8DE:
    bltui   a4, 3, loc_8F4
    l32r    a10, .LC68
    mov.n   a11, a3
    call8   lora_printf
    movi.n  a10, 8
    call8   delay

loc_8F4:
    movi.n  a11, 1
    movi.n  a10, 4
    call8   pinMode

    movi.n  a11, 1
    movi.n  a10, 5
    call8   pinMode

    movi.n  a11, 1
    movi.n  a10, 0xE
    call8   pinMode

    movi.n  a11, 1
    movi.n  a10, 0xF
    call8   pinMode

    movi.n  a11, 1
    movi.n  a10, 0x10
    call8   pinMode

    movi.n  a11, 1
    movi.n  a10, 0x11
    call8   pinMode

    movi.n  a11, 1
    movi.n  a10, 0x12
    call8   pinMode

    movi.n  a11, 1
    movi.n  a10, 0x13
    call8   pinMode

    movi.n  a11, 1
    movi.n  a10, 0x1A
    call8   pinMode

    movi.n  a11, 1
    movi.n  a10, 0x1B
    call8   pinMode

    call8   TimerGetCurrentTime

    add.n   a10, a3, a10
    l32r    a9, .LC69
    movi.n  a8, 1
    bltu    a10, a3, loc_96A

    movi.n  a8, 0

loc_96A:
    add.n   a11, a2, a11
    s32i.n  a10, a9, 0
    movi    a10, 0x3E8
    add.n   a8, a8, a11
    mull    a2, a10, a2
    muluh   a11, a10, a3
    mull    a10, a10, a3
    add     a11, a2, a11
    s32i    a8, a9, 4
    call8   esp_sleep_enable_timer_wakeup
    call8   esp_deep_sleep_start

loc_98E:
    call8   RtcGetTimerValue
    addi.n  a3, a10, 0xA
    movi.n  a8, 1
    bltu    a3, a10, loc_99D
    movi.n  a8, 0

loc_99D:
    l32i.n  a9, a2, 4
    add.n   a8, a8, a11
    bgeu    a9, a8, loc_9A7
    j       loc_837
/*---------------------------------------------------------------------------*/

loc_9A7:
    beq     a9, a8, loc_9AD
    j       loc_851
/*---------------------------------------------------------------------------*/

loc_9AD:
    l32i.n  a4, a2, 0
    bgeu    a4, a3, loc_9B5
    j       loc_837
/*---------------------------------------------------------------------------*/

loc_9B5:
    j       loc_851
    .size   _ZN8McuClass5sleepEhh, .-_ZN8McuClass5sleepEhh

/*============== O B J E C T S ======================================*/
	.global	Mcu
	.section	.bss.Mcu,"aw",@nobits
	.align	4
	.type	Mcu, @object
	.size	Mcu, 8
Mcu:
	.zero	8

	.global	toDeepSleep
	.section	.bss.toDeepSleep,"aw",@nobits
	.type	toDeepSleep, @object
	.size	toDeepSleep, 1
toDeepSleep:
	.zero	1

	.global	PARA_ADDR_BASE
	.section	.bss.PARA_ADDR_BASE,"aw",@nobits
	.align	4
	.type	PARA_ADDR_BASE, @object
	.size	PARA_ADDR_BASE, 4
PARA_ADDR_BASE:
	.zero	4

	.global	isfirstRun_ADDR
	.section	.bss.isfirstRun_ADDR,"aw",@nobits
	.align	4
	.type	isfirstRun_ADDR, @object
	.size	isfirstRun_ADDR, 4
isfirstRun_ADDR:
	.zero	4

	.global	license_addr
	.section	.bss.license_addr,"aw",@nobits
	.align	4
	.type	license_addr, @object
	.size	license_addr, 4
license_addr:
	.zero	4

	.global	tmstTemp
	.section	.bss.tmstTemp,"aw",@nobits
	.align	4
	.type	tmstTemp, @object
	.size	tmstTemp, 16
tmstTemp:
	.zero	16

	.global	correctlicense
	.section	.bss.correctlicense,"aw",@nobits
	.align	4
	.type	correctlicense, @object
	.size	correctlicense, 16
correctlicense:
	.zero	16

	.global	storedlicense
	.section	.bss.storedlicense,"aw",@nobits
	.align	4
	.type	storedlicense, @object
	.size	storedlicense, 16
storedlicense:
	.zero	16

	.global	timer
	.section	.bss.timer,"aw",@nobits
	.align	4
	.type	timer, @object
	.size	timer, 4
timer:
	.zero	4