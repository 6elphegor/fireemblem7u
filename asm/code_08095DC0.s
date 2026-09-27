	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08095DC0
sub_08095DC0: @ 0x08095DC0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	adds r5, r1, #0
	adds r7, r5, #0
	adds r0, r5, #7
	cmp r5, r0
	bge _08095E10
	ldr r0, _08095E1C @ =0x02012466
	ldrh r0, [r0]
	cmp r5, r0
	bge _08095E10
	ldr r1, _08095E20 @ =0x020117E4
	lsls r0, r5, #2
	adds r6, r0, r1
_08095DE0:
	ldrh r0, [r6, #2]
	lsls r4, r5, #1
	movs r1, #0x1f
	ands r4, r1
	lsls r4, r4, #6
	adds r4, #2
	add r4, r8
	bl GetItemIconId
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0x80
	lsls r2, r2, #7
	bl PutIcon
	adds r6, #4
	adds r5, #1
	adds r0, r7, #7
	cmp r5, r0
	bge _08095E10
	ldr r0, _08095E1C @ =0x02012466
	ldrh r0, [r0]
	cmp r5, r0
	blt _08095DE0
_08095E10:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08095E1C: .4byte 0x02012466
_08095E20: .4byte 0x020117E4
