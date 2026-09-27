	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0806C760
sub_0806C760: @ 0x0806C760
	push {r4, r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x64
	ldrh r1, [r0]
	adds r2, r1, #1
	adds r3, r2, #0
	strh r3, [r0]
	lsls r1, r1, #0x10
	asrs r0, r1, #0x10
	cmp r0, #0x27
	ble _0806C784
	ldr r0, [r7]
	bl Proc_Break
_0806C784:
	ldr r1, [r7]
	ldr r0, [r1, #0x50]
	ldr r2, [r7]
	ldr r1, [r2, #0x2c]
	ldr r2, [r7]
	ldr r3, [r2, #0x30]
	movs r4, #0x80
	lsls r4, r4, #1
	adds r2, r3, #0
	orrs r2, r4
	bl DisplaySpriteAnim
	add sp, #4
	pop {r4, r7}
	pop {r0}
	bx r0
