	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEkrUnitMainMini
NewEkrUnitMainMini: @ 0x08054EC8
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _08054EEC @ =0x08B9B2F4
	movs r1, #4
	bl Proc_Start
	adds r5, r0, #0
	adds r0, r4, #0
	bl InitMainMiniAnim
	str r4, [r5, #0x5c]
	str r5, [r4, #0x34]
	movs r0, #1
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08054EEC: .4byte 0x08B9B2F4
