	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08071D28
sub_08071D28: @ 0x08071D28
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r2, r1, #0
	adds r2, #0x44
	ldr r1, [r7]
	ldr r2, [r7]
	adds r0, r2, #0
	adds r2, #0x44
	ldrh r3, [r2]
	subs r0, r3, #1
	adds r2, r1, #0
	adds r1, #0x44
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r0, #0
	orrs r3, r2
	adds r2, r3, #0
	strh r2, [r1]
	lsls r1, r0, #0x10
	asrs r0, r1, #0x10
	movs r1, #1
	cmn r0, r1
	bne _08071D68
	ldr r0, [r7]
	bl Proc_Break
_08071D68:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
