	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08047C38
sub_08047C38: @ 0x08047C38
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x28
	mov r8, r0
	ldr r1, _08047C98 @ =0x081D552E
	mov r0, sp
	movs r2, #0x28
	bl memcpy
	ldr r4, _08047C9C @ =0x02024460
	ldr r0, _08047CA0 @ =0x08CC1C5C
	bl Proc_EndEach
	movs r3, #0
	movs r6, #0xf
	ldr r5, _08047CA4 @ =0x0000027F
_08047C5A:
	adds r2, r4, #0
	adds r0, r3, #0
	adds r4, r2, #2
	cmp r3, #0
	bge _08047C66
	adds r0, #0x1f
_08047C66:
	asrs r0, r0, #5
	lsls r0, r0, #1
	mov r7, sp
	adds r1, r7, r0
	adds r0, r6, #0
	ldrh r1, [r1]
	ands r0, r1
	lsls r0, r0, #0xc
	ldrh r1, [r2]
	adds r0, r1, r0
	strh r0, [r2]
	adds r3, #1
	cmp r3, r5
	ble _08047C5A
	ldr r0, _08047CA0 @ =0x08CC1C5C
	mov r1, r8
	bl Proc_Start
	add sp, #0x28
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08047C98: .4byte 0x081D552E
_08047C9C: .4byte 0x02024460
_08047CA0: .4byte 0x08CC1C5C
_08047CA4: .4byte 0x0000027F
