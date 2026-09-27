	.include "macro.inc"

	.syntax unified

	thumb_func_start SioWarpFx_StartSioWarp
SioWarpFx_StartSioWarp: @ 0x08047940
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0804796C @ =0x08B9A298
	movs r1, #2
	bl Proc_Start
	ldr r2, [r4, #0x2c]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	lsls r1, r1, #1
	str r1, [r0, #0x34]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	lsls r1, r1, #1
	str r1, [r0, #0x38]
	adds r4, #0x41
	ldrb r1, [r4]
	adds r0, #0x41
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804796C: .4byte 0x08B9A298
