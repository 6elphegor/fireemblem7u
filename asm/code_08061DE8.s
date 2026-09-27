	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08061DE8
sub_08061DE8: @ 0x08061DE8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r6, r0, #0
	mov r8, r1
	mov sb, r2
	adds r4, r3, #0
	ldr r7, [sp, #0x20]
	ldr r1, _08061E48 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08061E4C @ =0x08BA4044
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r6, [r5, #0x5c]
	ldr r0, _08061E50 @ =0x08BA402C
	lsls r4, r4, #2
	adds r4, r4, r0
	ldr r3, [r4]
	str r3, [sp]
	adds r0, r6, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r5, #0x60]
	mov r1, r8
	strh r1, [r0, #2]
	mov r2, sb
	strh r2, [r0, #4]
	ldr r1, _08061E54 @ =0x0000F3FF
	ldrh r2, [r0, #8]
	ands r1, r2
	orrs r1, r7
	strh r1, [r0, #8]
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08061E48: .4byte 0x0201774C
_08061E4C: .4byte 0x08BA4044
_08061E50: .4byte 0x08BA402C
_08061E54: .4byte 0x0000F3FF
