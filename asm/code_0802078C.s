	.include "macro.inc"

	.syntax unified

	thumb_func_start ProcDanceAnim_Loop_Blend
ProcDanceAnim_Loop_Blend: @ 0x0802078C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _080207D8 @ =0x03002870
	mov ip, r0
	mov r2, ip
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r3, r5, #0
	adds r3, #0x4c
	ldrh r0, [r3]
	mov r1, ip
	adds r1, #0x44
	movs r2, #0
	strb r0, [r1]
	mov r4, ip
	adds r4, #0x45
	movs r1, #0x10
	strb r1, [r4]
	mov r1, ip
	adds r1, #0x46
	strb r2, [r1]
	subs r0, #1
	strh r0, [r3]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _080207D0
	adds r0, r5, #0
	bl Proc_Break
_080207D0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080207D8: .4byte 0x03002870
