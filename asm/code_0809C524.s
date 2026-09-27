	.include "macro.inc"

	.syntax unified

	thumb_func_start GetSupportScreenPartnerCount
GetSupportScreenPartnerCount: @ 0x0809C524
	ldr r2, _0809C53C @ =0x08BDCE4C
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	adds r2, #0x2c
	adds r0, r0, r2
	ldr r0, [r0]
	cmp r0, #0
	beq _0809C540
	ldrb r0, [r0, #0x15]
	b _0809C542
	.align 2, 0
_0809C53C: .4byte 0x08BDCE4C
_0809C540:
	movs r0, #0
_0809C542:
	bx lr
