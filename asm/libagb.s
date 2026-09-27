	.include "macro.inc"

	.syntax unified

	thumb_func_start ArcTan2
ArcTan2: @ 0x080BFA04
	svc #0xa
	bx lr

	thumb_func_start BgAffineSet
BgAffineSet: @ 0x080BFA08
	svc #0xe
	bx lr

	thumb_func_start CpuFastSet
CpuFastSet: @ 0x080BFA0C
	svc #0xc
	bx lr

	thumb_func_start CpuSet
CpuSet: @ 0x080BFA10
	svc #0xb
	bx lr

	thumb_func_start Div
Div: @ 0x080BFA14
	svc #6
	bx lr

	thumb_func_start DivRem
DivRem: @ 0x080BFA18
	svc #6
	adds r0, r1, #0
	bx lr

	thumb_func_start HuffUnComp
HuffUnComp: @ 0x080BFA20
	svc #0x13
	bx lr

	thumb_func_start LZ77UnCompVram
LZ77UnCompVram: @ 0x080BFA24
	svc #0x12
	bx lr

	thumb_func_start LZ77UnCompWram
LZ77UnCompWram: @ 0x080BFA28
	svc #0x11
	bx lr

	thumb_func_start MultiBoot
MultiBoot: @ 0x080BFA2C
	movs r1, #1
	svc #0x25
	bx lr
	.align 2, 0

	thumb_func_start ObjAffineSet
ObjAffineSet: @ 0x080BFA34
	svc #0xf
	bx lr

	thumb_func_start RLUnCompVram
RLUnCompVram: @ 0x080BFA38
	svc #0x15
	bx lr

	thumb_func_start RLUnCompWram
RLUnCompWram: @ 0x080BFA3C
	svc #0x14
	bx lr

	thumb_func_start SoftReset
SoftReset: @ 0x080BFA40
	ldr r3, _080BFA50 @ =0x04000208
	movs r2, #0
	strb r2, [r3]
	ldr r1, _080BFA54 @ =0x03007F00
	mov sp, r1
	svc #1
	svc #0
	movs r0, r0
	.align 2, 0
_080BFA50: .4byte 0x04000208
_080BFA54: .4byte 0x03007F00

	thumb_func_start SoundBiasReset
SoundBiasReset: @ 0x080BFA58
	movs r0, #0
	svc #0x19
	bx lr
	.align 2, 0

	thumb_func_start SoundBiasSet
SoundBiasSet: @ 0x080BFA60
	movs r0, #1
	svc #0x19
	bx lr
	.align 2, 0

	thumb_func_start Sqrt
Sqrt: @ 0x080BFA68
	svc #8
	bx lr

	thumb_func_start VBlankIntrWait
VBlankIntrWait: @ 0x080BFA6C
	movs r2, #0
	svc #5
	bx lr
	.align 2, 0
