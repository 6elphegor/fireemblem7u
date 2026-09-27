	.include "macro.inc"

	.syntax unified

	thumb_func_start EnableBgSync
EnableBgSync: @ 0x08000FFC
	push {r7, lr}
	mov r7, sp
	ldr r1, _08001014 @ =0x0300000C
	ldr r2, _08001014 @ =0x0300000C
	ldrb r3, [r2]
	adds r2, r0, #0
	orrs r3, r2
	adds r2, r3, #0
	strb r2, [r1]
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08001014: .4byte 0x0300000C
