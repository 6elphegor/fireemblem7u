	.include "macro.inc"

	.syntax unified

	thumb_func_start GetSupportScreenPartnerCharId
GetSupportScreenPartnerCharId: @ 0x0809B0C0
	push {r4, r5, lr}
	adds r5, r1, #0
	ldr r4, _0809B0E0 @ =0x08BDCE4C
	bl GetSupportScreenCharIdAt
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	adds r4, #0x2c
	adds r0, r0, r4
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0809B0E0: .4byte 0x08BDCE4C
