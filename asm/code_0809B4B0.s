	.include "macro.inc"

	.syntax unified

	thumb_func_start GetTotalSupportLevel
GetTotalSupportLevel: @ 0x0809B4B0
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r6, #0
	movs r4, #0
	ldr r7, _0809B4BC @ =0x08BDCE78
	b _0809B4CC
	.align 2, 0
_0809B4BC: .4byte 0x08BDCE78
_0809B4C0:
	adds r0, r5, #0
	adds r1, r4, #0
	bl GetSupportScreenPartnerSupportLevel
	adds r6, r6, r0
	adds r4, #1
_0809B4CC:
	adds r0, r5, #0
	bl GetSupportScreenCharIdAt
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	adds r0, r0, r7
	ldr r0, [r0]
	ldrb r0, [r0, #0x15]
	cmp r4, r0
	blt _0809B4C0
	adds r0, r6, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
