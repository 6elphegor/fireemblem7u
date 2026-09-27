	.include "macro.inc"

	.syntax unified

	thumb_func_start StartSioHold
StartSioHold: @ 0x0803DB88
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	mov r8, r3
	ldr r7, [sp, #0x18]
	ldr r0, _0803DBB4 @ =0x08B98BC4
	adds r1, r4, #0
	bl Proc_Start
	str r5, [r0, #0x2c]
	str r6, [r0, #0x30]
	mov r1, r8
	str r1, [r0, #0x38]
	str r7, [r0, #0x34]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803DBB4: .4byte 0x08B98BC4
