	.include "macro.inc"

	.syntax unified

	thumb_func_start EnableBgSyncById
EnableBgSyncById: @ 0x08001018
	push {r4, r7, lr}
	mov r7, sp
	ldr r1, _08001034 @ =0x0300000C
	ldr r2, _08001034 @ =0x0300000C
	movs r4, #1
	adds r3, r4, #0
	lsls r3, r0
	ldrb r2, [r2]
	orrs r2, r3
	adds r3, r2, #0
	strb r3, [r1]
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08001034: .4byte 0x0300000C
