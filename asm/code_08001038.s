	.include "macro.inc"

	.syntax unified

	thumb_func_start DisableBgSync
DisableBgSync: @ 0x08001038
	push {r4, r7, lr}
	mov r7, sp
	ldr r1, _08001058 @ =0x0300000C
	ldr r2, _08001058 @ =0x0300000C
	adds r3, r0, #0
	mvns r4, r3
	ldrb r2, [r2]
	adds r3, r4, #0
	adds r4, r3, #0
	ands r2, r4
	adds r3, r2, #0
	strb r3, [r1]
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08001058: .4byte 0x0300000C
